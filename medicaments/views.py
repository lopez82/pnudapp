from calendar import month
from django.shortcuts import render,redirect,get_object_or_404,HttpResponseRedirect
from django.views.generic.edit import UpdateView,CreateView
from django.views.generic import ListView
from django.urls import reverse,reverse_lazy
from django.http import JsonResponse
from django.db.models.signals import post_save,post_delete
from django.db.models import Prefetch,F
from django.db.models.functions import Round
from datetime import datetime,timedelta
#from math import round
from decimal import Decimal
import calendar
from .models import BonLivraison, ConsMoy,DistrMoy, InventaireSage, Sortie, Categorie, Commande, Produit
from .forms import BonLivraisonForm, CommandeForm, InventaireForm,SortieForm
from .signals import livraison_post_save,livraison_post_delete


# Create your views here.

def get_finprob(date_stock,msd):
    if msd is None:
        msd=0
    return datetime.strftime(date_stock+timedelta(days=int(msd*30)),"%d %b %Y")

def get_date_finprob(date_stock,msd):
    if msd is None:
        msd=0
    return date_stock+timedelta(days=int(msd*30))


def get_rupture(date_fin,date_livraison):
    #print("&&&&&&&&&&&& ",date_fin,"   ",date_livraison)
    if date_livraison == None:
        date_livraison = datetime(2050,12,31)
    else:
        date_livraison = datetime(date_livraison.year,date_livraison.month,date_livraison.day)
        
    if date_fin>date_livraison:
        return "Non"
    else:
        return "Oui"

def months_between(d1, d2):
    #d1 = datetime.strptime(d1, "%Y-%m-%d")
    #d2 = datetime.strptime(d2, "%Y-%m-%d")
    return Decimal(abs(round((d2 - d1).days/30,1)))


def home(request,categorie=2):
    
    if request.method == 'POST':
        mois_stock = request.POST['mois_du']
        annee_stock = request.POST['annee_du']
        mois_evaluation = request.POST['mois_au']
        annee_evaluation = request.POST['annee_au']
        
    else:
        mois_stock = '07'
        annee_stock = '2022'
        mois_evaluation = '12'
        annee_evaluation = '2022'

        
    
    date_fin_mois_stock = calendar.monthrange(int(annee_stock),int(mois_stock))
    date_inventaire = datetime(int(annee_stock),int(mois_stock),int(date_fin_mois_stock[1]))

    
    date_fin_mois_evaluation = calendar.monthrange(int(annee_evaluation),int(mois_evaluation))
    date_evaluation = datetime(int(annee_evaluation),int(mois_evaluation),int(date_fin_mois_evaluation[1]))
    date_evaluation_str= datetime.strftime(date_evaluation,'%Y-%m-%d')

    qs_cmm = ConsMoy.objects.filter(annee=annee_stock)
    qs_commande = Commande.objects.filter(date_livraison__gt=date_inventaire,date_livraison__lte=date_evaluation)
    qs_sortie = Sortie.objects.filter(date_sortie__gt=date_inventaire,date_sortie__lte=date_evaluation)



    qs = InventaireSage.objects.filter(mois=mois_stock,annee=annee_stock,produit_inventaire__dashbord=1).select_related('produit_inventaire') .prefetch_related(Prefetch('produit_inventaire__consmoy_set',queryset=qs_cmm)) .prefetch_related(Prefetch('produit_inventaire__commande_set',queryset=qs_commande)). prefetch_related(Prefetch('produit_inventaire__sortie_set',queryset=qs_sortie)).values('produit_inventaire__id','produit_inventaire__designation','lot','quantite_sage','mois','annee','produit_inventaire__consmoy__value','produit_inventaire__commande__quantite_commande')

    
    sql = 'Select medicaments_inventairesage.id as id,medicaments_inventairesage.mois as mois,medicaments_inventairesage.annee as annee,SUM(medicaments_inventairesage.quantite_sage) as quantite_sage,SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage,0)) as quantite_exp ,medicaments_inventairesage.produit_inventaire_id as produit_id ,medicaments_produit.designation as designation ,round(medicaments_consmoy.value/12,0) as cmm ,SUM(IF(quantite_commande IS NULL,0,quantite_commande)) as quantite_commande,com.date_livraison,(SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage,0))) AS stock_utilisable,((SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage ,0)))+SUM(IF(quantite_commande IS NULL,0,quantite_commande))) AS stock_dispo_commande,ROUND((SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage,0)))/round(medicaments_consmoy.value/12,0),1) as msd_stock,ROUND((SUM(medicaments_inventairesage.quantite_sage)+IF(quantite_commande IS NULL,0,quantite_commande))/round(medicaments_consmoy.value/12,0),1) as msd_stock_commande from medicaments_inventairesage LEFT JOIN medicaments_produit ON(medicaments_produit.id = medicaments_inventairesage.produit_inventaire_id) LEFT JOIN medicaments_consmoy ON(medicaments_consmoy.produit_id = medicaments_produit.id and medicaments_consmoy.annee = %s) LEFT JOIN (SELECT produit_commande_id,SUM(IF(quantite_commande IS NULL,0,quantite_commande)) as quantite_commande,MIN(date_livraison) as date_livraison FROM medicaments_commande WHERE date_livraison > %s and date_livraison <=%s  GROUP BY produit_commande_id) as com on(com.produit_commande_id= medicaments_inventairesage.produit_inventaire_id)  WHERE  medicaments_produit.categorie_id = %s and medicaments_inventairesage.mois =%s and medicaments_inventairesage.annee = %s GROUP BY medicaments_inventairesage.produit_inventaire_id'

    sql_produit_perim='Select medicaments_inventairesage.id,medicaments_inventairesage.mois as mois,medicaments_inventairesage.annee as annee,SUM(IF(medicaments_inventairesage.date_exp < %s ,medicaments_inventairesage.quantite_sage,0)) as quantite_exp ,medicaments_inventairesage.produit_inventaire_id as produit_id ,medicaments_produit.designation as designation,prix_unitaire_sage as prix_unitaire,(SUM(IF(medicaments_inventairesage.date_exp < %s ,medicaments_inventairesage.quantite_sage,0))*prix_unitaire_sage) as prix_total from medicaments_inventairesage LEFT JOIN medicaments_produit ON(medicaments_produit.id = medicaments_inventairesage.produit_inventaire_id)   WHERE medicaments_produit.categorie_id = %s and medicaments_inventairesage.mois =%s and medicaments_inventairesage.annee = %s GROUP BY medicaments_inventairesage.produit_inventaire_id  HAVING quantite_exp>0'

    sql_produit_rupture = 'Select medicaments_inventairesage.id,medicaments_inventairesage.mois as mois,medicaments_inventairesage.annee as annee,medicaments_inventairesage.produit_inventaire_id as produit_id ,medicaments_produit.designation as designation,round(medicaments_consmoy.value/12,0) as cmm,SUM(medicaments_inventairesage.quantite_sage) as quantite_sage,SUM(IF(quantite_commande IS NULL,0,quantite_commande)) as quantite_commande,(SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp <%s,medicaments_inventairesage.quantite_sage,0))) AS stock_utilisable,((SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage ,0)))+SUM(IF(quantite_commande IS NULL,0,quantite_commande))) AS stock_dispo_commande,ROUND((SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage,0)))/round(medicaments_consmoy.value/12,0),1) as msd_stock,ROUND((SUM(medicaments_inventairesage.quantite_sage)+IF(quantite_commande IS NULL,0,quantite_commande))/round(medicaments_consmoy.value/12,0),1) as msd_stock_commande,com.date_livraison from medicaments_inventairesage LEFT JOIN medicaments_produit ON(medicaments_produit.id = medicaments_inventairesage.produit_inventaire_id) LEFT JOIN medicaments_consmoy ON(medicaments_consmoy.produit_id = medicaments_produit.id and medicaments_consmoy.annee = 2022) LEFT JOIN (SELECT produit_commande_id,SUM(IF(quantite_commande IS NULL,0,quantite_commande)) as quantite_commande,MIN(date_livraison) as date_livraison FROM medicaments_commande WHERE date_livraison > %s and date_livraison <=%s GROUP BY produit_commande_id) as com on(com.produit_commande_id= medicaments_inventairesage.produit_inventaire_id)  WHERE medicaments_produit.categorie_id = %s and medicaments_inventairesage.mois =%s and medicaments_inventairesage.annee = %s GROUP BY medicaments_inventairesage.produit_inventaire_id '

    sql_msd_inf6 = 'Select medicaments_inventairesage.id,medicaments_produit.designation as designation,(SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage,0))) AS stock_utilisable,ROUND((SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage,0)))/round(medicaments_consmoy.value/12,0),1) as msd_stock  from medicaments_inventairesage LEFT JOIN medicaments_produit ON(medicaments_produit.id = medicaments_inventairesage.produit_inventaire_id) LEFT JOIN medicaments_consmoy ON(medicaments_consmoy.produit_id = medicaments_produit.id and medicaments_consmoy.annee = %s)  WHERE medicaments_produit.categorie_id = %s and medicaments_inventairesage.mois =%s and medicaments_inventairesage.annee = %s GROUP BY medicaments_inventairesage.produit_inventaire_id HAVING msd_stock<6'

    sql_msd_sup6_inf12 = 'Select medicaments_inventairesage.id,medicaments_produit.designation as designation,(SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage,0))) AS stock_utilisable,ROUND((SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage,0)))/round(medicaments_consmoy.value/12,0),1) as msd_stock  from medicaments_inventairesage LEFT JOIN medicaments_produit ON(medicaments_produit.id = medicaments_inventairesage.produit_inventaire_id) LEFT JOIN medicaments_consmoy ON(medicaments_consmoy.produit_id = medicaments_produit.id and medicaments_consmoy.annee = %s)  WHERE medicaments_produit.categorie_id = %s and medicaments_inventairesage.mois =%s and medicaments_inventairesage.annee = %s GROUP BY medicaments_inventairesage.produit_inventaire_id HAVING msd_stock>6 and msd_stock<12'

    sql_msd_sup6 = 'Select medicaments_inventairesage.id,medicaments_produit.designation as designation,(SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage,0))) AS stock_utilisable,ROUND((SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage,0)))/round(medicaments_consmoy.value/12,0),1) as msd_stock  from medicaments_inventairesage LEFT JOIN medicaments_produit ON(medicaments_produit.id = medicaments_inventairesage.produit_inventaire_id) LEFT JOIN medicaments_consmoy ON(medicaments_consmoy.produit_id = medicaments_produit.id and medicaments_consmoy.annee = %s)  WHERE medicaments_produit.categorie_id = %s and medicaments_inventairesage.mois =%s and medicaments_inventairesage.annee = %s GROUP BY medicaments_inventairesage.produit_inventaire_id HAVING msd_stock>6 '

    results = InventaireSage.objects.raw(sql,[date_evaluation_str,date_evaluation_str,date_evaluation_str,date_evaluation_str,annee_stock,date_inventaire,date_evaluation_str,categorie,mois_stock,annee_stock])

    resultat_produit_perim = InventaireSage.objects.raw(sql_produit_perim,[date_evaluation_str,date_evaluation_str,categorie,mois_stock,annee_stock])

    resultat_produit_rupture = InventaireSage.objects.raw(sql_produit_rupture,[date_evaluation_str,date_evaluation_str,date_evaluation_str,date_evaluation_str,date_evaluation_str,categorie,mois_stock,annee_stock])

    resultat_msd_inf6 = InventaireSage.objects.raw(sql_msd_inf6,[date_inventaire,date_inventaire,annee_stock,categorie,mois_stock,annee_stock])

    resultat_msd_sup6_inf12 = InventaireSage.objects.raw(sql_msd_sup6_inf12,[date_inventaire,date_inventaire,annee_stock,categorie,mois_stock,annee_stock])

    resultat_msd_sup6 = InventaireSage.objects.raw(sql_msd_sup6,[date_inventaire,date_inventaire,annee_stock,categorie,mois_stock,annee_stock])
    
    
    #print("%%%%%%%%%%%%%%%%%%%% ",results.query)
    result_list =[]
    resultat_rupture_list=[]

    
    for r in results:
       
       
       result_dict={
        'id':r.id,
        'mois':r.mois,
        'annee':r.annee,
        'quantite_sage':r.quantite_sage,
        'produit_id':r.produit_id,
        'designation':r.designation,
        'cmm':'-' if r.cmm == None else r.cmm,
        'quantite_commande':'-' if r.quantite_commande == None else r.quantite_commande,
        'quantite_exp': r.quantite_exp,
        'stock_utilisable':r.stock_utilisable,
        'stock_dispo_commande':r.stock_dispo_commande,
        'msd_stock':'-' if r.msd_stock== None else r.msd_stock,
        'msd_stock_commande':r.msd_stock_commande,
        'fin_prob': get_finprob(date_inventaire,r.msd_stock),
        'fin_prob_stock_commande': get_finprob(date_inventaire,r.msd_stock_commande),
        'rupture_av_livraison': '-' if r.msd_stock== None else get_rupture(get_date_finprob(date_inventaire,r.msd_stock),r.date_livraison),


       }
       result_list.append(result_dict)

    
    for r in resultat_produit_rupture:
        result_dict={            
            'quantite_sage':r.quantite_sage,
            'produit_id':r.produit_id,
            'designation':r.designation,
            'fin_prob_stock_commande': get_finprob(date_inventaire,r.msd_stock_commande),
            'duree_rupture': abs(round(r.msd_stock_commande-months_between(date_evaluation,date_inventaire),1)) if r.msd_stock_commande != None else abs(round(months_between(date_evaluation,get_date_finprob(date_inventaire,r.msd_stock_commande)),1))

        }
        #print('%%%%%%%%%%%%%%%%%%%%%%%%%%  ',result_dict)
        if get_date_finprob(date_inventaire,r.msd_stock_commande) < date_evaluation:
            resultat_rupture_list.append(result_dict)


    context ={"results":result_list,"result_produit_perim":resultat_produit_perim,"resultat_rupture_list":resultat_rupture_list,'resultat_msd_inf6':resultat_msd_inf6,'resultat_msd_sup6_inf12':resultat_msd_sup6_inf12,'resultat_msd_sup6':resultat_msd_sup6,'categorie':categorie}
    return render(request,"medicaments/home.html",context=context)

#################fin home page for cmm
####################home page for dmm analyses #########################
def home_dmm(request,categorie=2):
    
    if request.method == 'POST':
        mois_stock = request.POST['mois_du']
        annee_stock = request.POST['annee_du']
        mois_evaluation = request.POST['mois_au']
        annee_evaluation = request.POST['annee_au']
        
    else:
        mois_stock = '07'
        annee_stock = '2022'
        mois_evaluation = '12'
        annee_evaluation = '2022'

        
    
    date_fin_mois_stock = calendar.monthrange(int(annee_stock),int(mois_stock))
    date_inventaire = datetime(int(annee_stock),int(mois_stock),int(date_fin_mois_stock[1]))

    
    date_fin_mois_evaluation = calendar.monthrange(int(annee_evaluation),int(mois_evaluation))
    date_evaluation = datetime(int(annee_evaluation),int(mois_evaluation),int(date_fin_mois_evaluation[1]))
    date_evaluation_str= datetime.strftime(date_evaluation,'%Y-%m-%d')

    qs_distr = DistrMoy.objects.filter(annee=annee_stock)
    qs_commande = Commande.objects.filter(date_livraison__gt=date_inventaire,date_livraison__lte=date_evaluation)
    qs_sortie = Sortie.objects.filter(date_sortie__gt=date_inventaire,date_sortie__lte=date_evaluation)



    qs = InventaireSage.objects.filter(mois=mois_stock,annee=annee_stock,produit_inventaire__dashbord=1).select_related('produit_inventaire') .prefetch_related(Prefetch('produit_inventaire__distrmoy_set',queryset=qs_distr)) .prefetch_related(Prefetch('produit_inventaire__commande_set',queryset=qs_commande)). prefetch_related(Prefetch('produit_inventaire__sortie_set',queryset=qs_sortie)).values('produit_inventaire__id','produit_inventaire__designation','lot','quantite_sage','mois','annee','produit_inventaire__distrmoy__value','produit_inventaire__commande__quantite_commande')

    
    sql = 'Select medicaments_inventairesage.id as id,medicaments_inventairesage.mois as mois,medicaments_inventairesage.annee as annee,SUM(medicaments_inventairesage.quantite_sage) as quantite_sage,SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage,0)) as quantite_exp ,medicaments_inventairesage.produit_inventaire_id as produit_id ,medicaments_produit.designation as designation ,round(medicaments_distrmoy.value/12,0) as distr ,SUM(IF(quantite_commande IS NULL,0,quantite_commande)) as quantite_commande,com.date_livraison,(SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage,0))) AS stock_utilisable,((SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage ,0)))+SUM(IF(quantite_commande IS NULL,0,quantite_commande))) AS stock_dispo_commande,ROUND((SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage,0)))/round(medicaments_distrmoy.value/12,0),1) as msd_stock,ROUND((SUM(medicaments_inventairesage.quantite_sage)+IF(quantite_commande IS NULL,0,quantite_commande))/round(medicaments_distrmoy.value/12,0),1) as msd_stock_commande from medicaments_inventairesage LEFT JOIN medicaments_produit ON(medicaments_produit.id = medicaments_inventairesage.produit_inventaire_id) LEFT JOIN medicaments_distrmoy ON(medicaments_distrmoy.produit_id = medicaments_produit.id and medicaments_distrmoy.annee = %s) LEFT JOIN (SELECT produit_commande_id,SUM(IF(quantite_commande IS NULL,0,quantite_commande)) as quantite_commande,MIN(date_livraison) as date_livraison FROM medicaments_commande WHERE date_livraison > %s and date_livraison <=%s  GROUP BY produit_commande_id) as com on(com.produit_commande_id= medicaments_inventairesage.produit_inventaire_id)  WHERE  medicaments_produit.categorie_id = %s and medicaments_inventairesage.mois =%s and medicaments_inventairesage.annee = %s GROUP BY medicaments_inventairesage.produit_inventaire_id'

    sql_produit_perim='Select medicaments_inventairesage.id,medicaments_inventairesage.mois as mois,medicaments_inventairesage.annee as annee,SUM(IF(medicaments_inventairesage.date_exp < %s ,medicaments_inventairesage.quantite_sage,0)) as quantite_exp ,medicaments_inventairesage.produit_inventaire_id as produit_id ,medicaments_produit.designation as designation,prix_unitaire_sage as prix_unitaire,(SUM(IF(medicaments_inventairesage.date_exp < %s ,medicaments_inventairesage.quantite_sage,0))*prix_unitaire_sage) as prix_total from medicaments_inventairesage LEFT JOIN medicaments_produit ON(medicaments_produit.id = medicaments_inventairesage.produit_inventaire_id)   WHERE medicaments_produit.categorie_id = %s and medicaments_inventairesage.mois =%s and medicaments_inventairesage.annee = %s GROUP BY medicaments_inventairesage.produit_inventaire_id  HAVING quantite_exp>0'

    sql_produit_rupture = 'Select medicaments_inventairesage.id,medicaments_inventairesage.mois as mois,medicaments_inventairesage.annee as annee,medicaments_inventairesage.produit_inventaire_id as produit_id ,medicaments_produit.designation as designation,round(medicaments_distrmoy.value/12,0) as distr,SUM(medicaments_inventairesage.quantite_sage) as quantite_sage,SUM(IF(quantite_commande IS NULL,0,quantite_commande)) as quantite_commande,(SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp <%s,medicaments_inventairesage.quantite_sage,0))) AS stock_utilisable,((SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage ,0)))+SUM(IF(quantite_commande IS NULL,0,quantite_commande))) AS stock_dispo_commande,ROUND((SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage,0)))/round(medicaments_distrmoy.value/12,0),1) as msd_stock,ROUND((SUM(medicaments_inventairesage.quantite_sage)+IF(quantite_commande IS NULL,0,quantite_commande))/round(medicaments_distrmoy.value/12,0),1) as msd_stock_commande,com.date_livraison from medicaments_inventairesage LEFT JOIN medicaments_produit ON(medicaments_produit.id = medicaments_inventairesage.produit_inventaire_id) LEFT JOIN medicaments_distrmoy ON(medicaments_distrmoy.produit_id = medicaments_produit.id and medicaments_distrmoy.annee = 2022) LEFT JOIN (SELECT produit_commande_id,SUM(IF(quantite_commande IS NULL,0,quantite_commande)) as quantite_commande,MIN(date_livraison) as date_livraison FROM medicaments_commande WHERE date_livraison > %s and date_livraison <=%s GROUP BY produit_commande_id) as com on(com.produit_commande_id= medicaments_inventairesage.produit_inventaire_id)  WHERE medicaments_produit.categorie_id = %s and medicaments_inventairesage.mois =%s and medicaments_inventairesage.annee = %s GROUP BY medicaments_inventairesage.produit_inventaire_id '

    sql_msd_inf6 = 'Select medicaments_inventairesage.id,medicaments_produit.designation as designation,(SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage,0))) AS stock_utilisable,ROUND((SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage,0)))/round(medicaments_distrmoy.value/12,0),1) as msd_stock  from medicaments_inventairesage LEFT JOIN medicaments_produit ON(medicaments_produit.id = medicaments_inventairesage.produit_inventaire_id) LEFT JOIN medicaments_distrmoy ON(medicaments_distrmoy.produit_id = medicaments_produit.id and medicaments_distrmoy.annee = %s)  WHERE medicaments_produit.categorie_id = %s and medicaments_inventairesage.mois =%s and medicaments_inventairesage.annee = %s GROUP BY medicaments_inventairesage.produit_inventaire_id HAVING msd_stock<6'

    sql_msd_sup6_inf12 = 'Select medicaments_inventairesage.id,medicaments_produit.designation as designation,(SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage,0))) AS stock_utilisable,ROUND((SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage,0)))/round(medicaments_distrmoy.value/12,0),1) as msd_stock  from medicaments_inventairesage LEFT JOIN medicaments_produit ON(medicaments_produit.id = medicaments_inventairesage.produit_inventaire_id) LEFT JOIN medicaments_distrmoy ON(medicaments_distrmoy.produit_id = medicaments_produit.id and medicaments_distrmoy.annee = %s)  WHERE medicaments_produit.categorie_id = %s and medicaments_inventairesage.mois =%s and medicaments_inventairesage.annee = %s GROUP BY medicaments_inventairesage.produit_inventaire_id HAVING msd_stock>6 and msd_stock<12'

    sql_msd_sup6 = 'Select medicaments_inventairesage.id,medicaments_produit.designation as designation,(SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage,0))) AS stock_utilisable,ROUND((SUM(medicaments_inventairesage.quantite_sage)-SUM(IF(medicaments_inventairesage.date_exp<%s,medicaments_inventairesage.quantite_sage,0)))/round(medicaments_distrmoy.value/12,0),1) as msd_stock  from medicaments_inventairesage LEFT JOIN medicaments_produit ON(medicaments_produit.id = medicaments_inventairesage.produit_inventaire_id) LEFT JOIN medicaments_distrmoy ON(medicaments_distrmoy.produit_id = medicaments_produit.id and medicaments_distrmoy.annee = %s)  WHERE medicaments_produit.categorie_id = %s and medicaments_inventairesage.mois =%s and medicaments_inventairesage.annee = %s GROUP BY medicaments_inventairesage.produit_inventaire_id HAVING msd_stock>6 '

    results = InventaireSage.objects.raw(sql,[date_evaluation_str,date_evaluation_str,date_evaluation_str,date_evaluation_str,annee_stock,date_inventaire,date_evaluation_str,categorie,mois_stock,annee_stock])

    resultat_produit_perim = InventaireSage.objects.raw(sql_produit_perim,[date_evaluation_str,date_evaluation_str,categorie,mois_stock,annee_stock])

    resultat_produit_rupture = InventaireSage.objects.raw(sql_produit_rupture,[date_evaluation_str,date_evaluation_str,date_evaluation_str,date_evaluation_str,date_evaluation_str,categorie,mois_stock,annee_stock])

    resultat_msd_inf6 = InventaireSage.objects.raw(sql_msd_inf6,[date_inventaire,date_inventaire,annee_stock,categorie,mois_stock,annee_stock])

    resultat_msd_sup6_inf12 = InventaireSage.objects.raw(sql_msd_sup6_inf12,[date_inventaire,date_inventaire,annee_stock,categorie,mois_stock,annee_stock])

    resultat_msd_sup6 = InventaireSage.objects.raw(sql_msd_sup6,[date_inventaire,date_inventaire,annee_stock,categorie,mois_stock,annee_stock])
    
    
    #print("%%%%%%%%%%%%%%%%%%%% ",results.query)
    result_list =[]
    resultat_rupture_list=[]

    
    for r in results:
       
       
       result_dict={
        'id':r.id,
        'mois':r.mois,
        'annee':r.annee,
        'quantite_sage':r.quantite_sage,
        'produit_id':r.produit_id,
        'designation':r.designation,
        'distr':'-' if r.distr == None else r.distr,
        'quantite_commande':'-' if r.quantite_commande == None else r.quantite_commande,
        'quantite_exp': r.quantite_exp,
        'stock_utilisable':r.stock_utilisable,
        'stock_dispo_commande':r.stock_dispo_commande,
        'msd_stock':'-' if r.msd_stock== None else r.msd_stock,
        'msd_stock_commande':r.msd_stock_commande,
        'fin_prob': get_finprob(date_inventaire,r.msd_stock),
        'fin_prob_stock_commande': get_finprob(date_inventaire,r.msd_stock_commande),
        'rupture_av_livraison': '-' if r.msd_stock== None else get_rupture(get_date_finprob(date_inventaire,r.msd_stock),r.date_livraison),


       }
       result_list.append(result_dict)

    
    for r in resultat_produit_rupture:
        result_dict={            
            'quantite_sage':r.quantite_sage,
            'produit_id':r.produit_id,
            'designation':r.designation,
            'fin_prob_stock_commande': get_finprob(date_inventaire,r.msd_stock_commande),
            'duree_rupture': abs(round(r.msd_stock_commande-months_between(date_evaluation,date_inventaire),1)) if r.msd_stock_commande != None else abs(round(months_between(date_evaluation,get_date_finprob(date_inventaire,r.msd_stock_commande)),1))

        }
        #print('%%%%%%%%%%%%%%%%%%%%%%%%%%  ',result_dict)
        if get_date_finprob(date_inventaire,r.msd_stock_commande) < date_evaluation:
            resultat_rupture_list.append(result_dict)


    context ={"results":result_list,"result_produit_perim":resultat_produit_perim,"resultat_rupture_list":resultat_rupture_list,'resultat_msd_inf6':resultat_msd_inf6,'resultat_msd_sup6_inf12':resultat_msd_sup6_inf12,'resultat_msd_sup6':resultat_msd_sup6,'categorie':categorie}
    return render(request,"medicaments/home_dmm.html",context=context)
################commandes views #################################
class CommandeCreateView(CreateView):
    model = Commande
    form_class = CommandeForm
    #fields: ['categorie','produit_commande','quantite_commande','prix_unitaire','date_exp','date_livraison','partenaire']
    template_name = 'medicaments/commande_form.html'   

    def post(self, request, *args, **kwargs):        
        form_class = self.get_form_class()
        form = self.get_form(form_class)

        if form.is_valid():
            commande_form = form.save(commit=False)         
            commande_form.date_exp = datetime.strptime(form.data['date_exp'],'%m/%d/%Y')
            commande_form.date_livraison = datetime.strptime(form.data['date_livraison'],'%m/%d/%Y')
            commande_form.save()
        
            return redirect("commande_list")
           # return self.form_valid(form)
        else:
            return self.form_invalid(form)
        
    def form_valid(self, form):       
        commande_form = form.save(commit=False)         
        commande_form.date_exp = datetime.strptime(form.data['date_exp'],'%m/%d/%Y')
        commande_form.date_livraison = datetime.strptime(form.data['date_livraison'],'%m/%d/%Y')
        commande_form.save()
        
        return redirect("commande_list")
    def form_invalid(self, form):
        return self.render_to_response(
            self.get_context_data(form=form)
        ) 

################commandes views #################################
class CommandeCreateView(CreateView):
    model = Commande
    form_class = CommandeForm
    #fields: ['categorie','produit_commande','quantite_commande','prix_unitaire','date_exp','date_livraison','partenaire']
    template_name = 'medicaments/commande_form.html'   

    def post(self, request, *args, **kwargs):        
        form_class = self.get_form_class()
        form = self.get_form(form_class)

        if form.is_valid():
            commande_form = form.save(commit=False)         
            commande_form.date_exp = datetime.strptime(form.data['date_exp'],'%m/%d/%Y')
            commande_form.date_livraison = datetime.strptime(form.data['date_livraison'],'%m/%d/%Y')
            commande_form.save()
        
            return redirect("commande_list")
           # return self.form_valid(form)
        else:
            return self.form_invalid(form)
        
    def form_valid(self, form):       
        commande_form = form.save(commit=False)         
        commande_form.date_exp = datetime.strptime(form.data['date_exp'],'%m/%d/%Y')
        commande_form.date_livraison = datetime.strptime(form.data['date_livraison'],'%m/%d/%Y')
        commande_form.save()
        
        return redirect("commande_list")
    def form_invalid(self, form):
        return self.render_to_response(
            self.get_context_data(form=form)
        ) 
    
class CommandeListView(ListView):
    model = Commande   
    template_name = 'medicaments/commande_list.html'
    context_object_name = 'commandes_list'

class CommandeUpdateView(UpdateView):
    model = Commande  
    form_class = CommandeForm 
    template_name = 'medicaments/commande_form.html'
    context_object_name = 'form'

    def get_initial(self):        

        return {
            'categorie':self.get_object().produit_commande.categorie
        }

    def update(self, request, *args, **kwargs):        
        self.object = None
        form_class = self.get_form_class()
        form = self.get_form(form_class)
        
        if form.is_valid():
            return self.form_valid(form)
        else:
            return self.form_invalid(form)


    def form_valid(self, form):
        
        commande_form = form.save(commit=False)
        
        #lot_form.date_exp = datetime.strptime(form.data['date_exp'],'%m/%d/%Y')
        #lot_form.date_estime_livraison = datetime.strptime(form.data['date_estime_livraison'],'%m/%d/%Y')
        commande_form.date_exp = datetime.strptime(form.data['date_exp'],'%Y-%m-%d')
        commande_form.date_livraison = datetime.strptime(form.data['date_livraison'],'%Y-%m-%d')
        #lot_form.partenaire_id = form.data['partenaire']
        

        commande_form.save()
        
        
        return redirect("commande_list")

    def form_invalid(self, form):
        return self.render_to_response(
            self.get_context_data(form=form)
        )


def delete_commande(request,pk):

    try:
        commande = Commande.objects.filter(pk=pk).delete()
    except:
        pass    
    return redirect('commande_list')



class InventaireListView(ListView):
    model = InventaireSage   
    template_name = 'medicaments/inventaire_list.html'
    context_object_name = 'inventaires_list'

class InventaireProduitListView(ListView):
    
    def get_queryset(self,*args,**kwargs):
        produit_id = self.kwargs['produit_id']
        mois = self.kwargs['mois']
        annee = self.kwargs['annee']
        return InventaireSage.objects.filter(produit_inventaire__id = produit_id) 
   
    template_name = 'medicaments/inventaire_produit_list.html'
    context_object_name = 'inventaire_produit_list'

class InventaireCreateView(CreateView):
    model = InventaireSage
    form_class = InventaireForm    
    template_name = 'medicaments/inventaire_form.html'   

    def post(self, request, *args, **kwargs):        
        form_class = self.get_form_class()
        form = self.get_form(form_class)

        if form.is_valid():
            commande_form = form.save()    
            return redirect("inventaire_list")
          
        else:
            return self.render_to_response(
            self.get_context_data(form=form)
        ) 
        
    
    


class InventaireUpdateView(UpdateView):
    model = InventaireSage  
    form_class = InventaireForm 
    template_name = 'medicaments/inventaire_form.html'
    context_object_name = 'form'
    #success_url: reverse_lazy("inventaire_list")

    def get_initial(self):        

        return {
            'categorie':self.get_object().produit_inventaire.categorie
        }

    def update(self, request, *args, **kwargs):        
        self.object = None
        form_class = self.get_form_class()
        form = self.get_form(form_class)
        
        if form.is_valid():
            inventaire_form = form.save()         
            return redirect("inventaire_list")

        else:
            return self.render_to_response(
            self.get_context_data(form=form)
        )




def delete_inventaire(request,pk):
    try:
        sortie = InventaireSage.objects.filter(pk=pk).delete()
    except:
        pass    
    return redirect('inventaire_list')


def get_products_ajax(request):
    data = []    
    if request.method == "POST":
        categorie_id = request.POST['categorie_id']
        try:
            categorie = Categorie.objects.filter(id = categorie_id)
            produits = Produit.objects.filter(categorie__id = categorie_id)            
           
        except Exception:
            data['error_message'] = 'error'
            return JsonResponse(data)
        
        return JsonResponse(list(produits.values('id', 'designation')), safe = False) 

################end commandes views #################################
################Bon Livraisson views #################################
class BonLivraisonCreateView(CreateView):
    model: BonLivraison
    form_class = BonLivraisonForm
    
    template_name = 'medicaments/livraison_form.html'   

    def post(self, request, *args, **kwargs):        
        form_class = self.get_form_class()
        form = self.get_form(form_class)
        
        if form.is_valid():
            return self.form_valid(form)
        else:
            return self.form_invalid(form)
        
    def form_valid(self, form):       
        bon_commande_form = form.save(commit=False)              
        bon_commande_form.date_exp = datetime.strptime(form.data['date_exp'],'%m/%d/%Y')
        bon_commande_form.date_livraison = datetime.strptime(form.data['date_livraison'],'%m/%d/%Y')      

        bon_commande_form.save()
        
        return redirect("livraison_list")
    def form_invalid(self, form):
        return self.render_to_response(
            self.get_context_data(form=form)
        ) 

class LivraisonListView(ListView):
    model = BonLivraison   
    template_name = 'medicaments/livraison_list.html'
    context_object_name = 'livraisons_list'

class LivraisonUpdateView(UpdateView):
    model = BonLivraison  
    form_class = BonLivraisonForm 
    template_name = 'medicaments/livraison_form.html'
    context_object_name = 'form'

    def get_initial(self):        

        return {
            'commande':self.get_object().commande
        }

    def update(self, request, *args, **kwargs):        
        self.object = None
        form_class = self.get_form_class()
        form = self.get_form(form_class)
        
        if form.is_valid():
            return self.form_valid(form)
        else:
            return self.form_invalid(form)


    def form_valid(self, form):
        
        livraison_form = form.save(commit=False)      
        
        livraison_form.date_exp = datetime.strptime(form.data['date_exp'],'%Y-%m-%d')
        livraison_form.date_estime_livraison = datetime.strptime(form.data['date_livraison'],'%Y-%m-%d')        

        livraison_form.save()       
        
        return redirect("livraison_list")

    def form_invalid(self, form):
        return self.render_to_response(
            self.get_context_data(form=form)
        )


def livraison_delete(request,pk):

    try:
        commande = BonLivraison.objects.filter(pk=pk).delete()
    except:
        pass    
    return redirect('livraison_list')
###siganls pour l'etat de la commande
post_save.connect(livraison_post_save,sender=BonLivraison)
post_delete.connect(livraison_post_delete,sender=BonLivraison)
   
################end livraison views #################################  
################Bon sortie views #################################
class SortieCreateView(CreateView):
    model: Sortie
    form_class = SortieForm    
    template_name = 'medicaments/sortie_form.html'   

    def post(self, request, *args, **kwargs):        
        form_class = self.get_form_class()
        form = self.get_form(form_class)
        
        if form.is_valid():
            return self.form_valid(form)
        else:
            return self.form_invalid(form)
        
    def form_valid(self, form):       
        sortie_form = form.save(commit=False)              
        sortie_form.date_sortie = datetime.strptime(form.data['date_sortie'],'%m/%d/%Y')
        sortie_form.save()
        
        return redirect("sortie_list")
    def form_invalid(self, form):
        return self.render_to_response(
            self.get_context_data(form=form)
        ) 

class SortieListView(ListView):
    model = Sortie   
    template_name = 'medicaments/sortie_list.html'
    context_object_name = 'sorties_list'

class SortieUpdateView(UpdateView):
    model = Sortie  
    form_class = SortieForm 
    template_name = 'medicaments/sortie_form.html'
    context_object_name = 'form'

    def get_initial(self):        

        return {
            'livraison':self.get_object().livraison
        }

    def update(self, request, *args, **kwargs):        
        self.object = None
        form_class = self.get_form_class()
        form = self.get_form(form_class)
        
        if form.is_valid():
            return self.form_valid(form)
        else:
            return self.form_invalid(form)


    def form_valid(self, form):
        
        sortie_form = form.save(commit=False)      
        sortie_form.date_sortie = datetime.strptime(form.data['date_sortie'],'%Y-%m-%d')  
        sortie_form.save()       
        
        return redirect("sortie_list")

    def form_invalid(self, form):
        return self.render_to_response(
            self.get_context_data(form=form)
        )


def sortie_delete(request,pk):

    try:
        sortie = Sortie.objects.filter(pk=pk).delete()
    except:
        pass    
    return redirect('sortie_list')
   
################end sortie views #################################  