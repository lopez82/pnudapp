from asyncio.windows_events import NULL
from email.policy import default
from gettext import NullTranslations
from tkinter import CASCADE
from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse

# Create your models here.
class Categorie(models.Model):
    CATEGORIE_CHOICES = (
        ('medicament','medicament'),
        ('test_rapid','test rapide'),
        ('reactif','reactif'),
        ('preservatif','preservatif'),
       
    )
    nom = models.CharField(max_length=255,verbose_name='categorie')
    def __str__(self):
        return self.nom
    
class Programme(models.Model):
    CATEGORIE_CHOICES = (
        ('vih','VIH'),
        ('tb','TB'),
        ('malaria','Malaria'),
        
       
    )
    nom = models.CharField(max_length=255,verbose_name='programme')
    def __str__(self):
        return self.nom
class Produit(models.Model):
    designation = models.CharField(max_length=500,verbose_name='desigantion')
    num_ref = models.CharField(max_length=255,verbose_name='Num Ref',null=True,blank=True)
    taille_paquet = models.PositiveIntegerField(default=1)
    categorie = models.ForeignKey(Categorie,on_delete=models.PROTECT,verbose_name='categorie')
    programme = models.ForeignKey(Programme,on_delete=models.PROTECT,verbose_name='programme',default=1)
    dashbord = models.BooleanField(default=0)
    class Meta:
        ordering =['designation']
    def __str__(self):
        return f"{self.designation} - {self.num_ref}"

class ConsMoy(models.Model):
    ANNEE_CHOICES =(
        (2022,2022),
        (2021,2021),
        (2020,2022),
    )
    produit = models.ForeignKey(Produit,on_delete=models.CASCADE,verbose_name='produit')
    annee = models.PositiveIntegerField(verbose_name='annee',choices=ANNEE_CHOICES)
    value = models.PositiveIntegerField(verbose_name='cons. moyenne annuel')
    def __str__(self):
        return f"{self.produit} - ({round(int(self.value)/12,0)})"

class DistrMoy(models.Model):
    ANNEE_CHOICES =(
        (2022,2022),
        (2021,2021),
        (2020,2022),
    )
    produit = models.ForeignKey(Produit,on_delete=models.CASCADE,verbose_name='produit')
    annee = models.PositiveIntegerField(verbose_name='annee',choices=ANNEE_CHOICES)
    value = models.PositiveIntegerField(verbose_name='Distr. moyenne annuelle')
    def __str__(self):
        return f"{self.produit} - ({round(int(self.value)/12,0)})"

class Partenaire(models.Model):    
    nom = models.CharField(max_length=255,verbose_name='partenaire')
    def __str__(self):
        return self.nom

class EtatCommande(models.Model):
    etat = models.CharField(max_length=255,verbose_name='Etat Commande')
    def __str__(self):
        return self.etat 
""" Le model Lot represente une commande"""  
class Commande(models.Model):     
   
    produit_commande = models.ForeignKey(Produit,on_delete=models.PROTECT,verbose_name='Produit',null=True)
    partenaire= models.ForeignKey(Partenaire,on_delete=models.PROTECT,verbose_name='partenaire',default=1)
    quantite_commande = models.PositiveIntegerField(verbose_name='quantite',null=True)
    prix_unitaire = models.PositiveIntegerField(verbose_name='prix unitaire(BIF)')
    date_livraison = models.DateField(verbose_name='Date livraison',null=True)
    date_exp = models.DateField(verbose_name='Date exp.',null=True)
    lot_commande = models.CharField(max_length=500,verbose_name='lot',blank=True,null=True)
    observation = models.CharField(max_length=500,verbose_name='observation',blank=True,null=True)

    def __str__(self):
        return f"{self.partenaire} - {self.produit_commande} ({self.quantite_commande})"

class BonLivraison(models.Model):
    fournisseur = models.CharField(max_length=500,verbose_name='Fournisseur')
    num = models.CharField(max_length=255,verbose_name='Num lot')
    commande =models.ForeignKey(Commande,on_delete=models.CASCADE)    
    quantite = models.PositiveIntegerField(verbose_name='quantite')
    date_livraison =models.DateField(verbose_name='date livraison')
    date_exp = models.DateField(verbose_name='Date exp.',null=True)
    user = models.ForeignKey(User,on_delete=models.SET_NULL,null=True,)
    observation = models.CharField(max_length=500,verbose_name='observation',blank=True,null=True)

    def __str__(self):
        return f"{self.commande}"

class Sortie(models.Model):
    produit_sortie = models.ForeignKey(Produit,on_delete=models.PROTECT,verbose_name='produit',default=1)
    quantite_sortie = models.PositiveIntegerField(verbose_name='quantite')
    date_sortie =models.DateField(verbose_name='date sortie')
    lot_sortie = models.CharField(max_length=500,verbose_name='lot',blank=True,null=True)
    observation_sortie = models.CharField(max_length=500,verbose_name='observation',blank=True,null=True)
    def __str__(self):
        return f"{self.produit_sortie} ({self.quantite_sortie})"
        #return f"{self.num_lot} - {self.produit.designation} ({self.quantite})"

class InventaireSage(models.Model):
    MOIS_CHOICES = (
        ('01','janvier'),
        ('02','Fevrier'),
        ('03','Mars'),
        ('04','Avril'),
        ('05','Mai'),
        ('06','Juin'),
        ('07','Juillet'),
        ('08','Aout'),
        ('09','Septembre'),
        ('10','Octobre'),
        ('11','Novembre'),
        ('12','Decembre'),

    )
    ANNEE_CHOICES =(
        ('2022','2022'),
        ('2021','2021'),
        
    )
    produit_inventaire = models.ForeignKey(Produit,on_delete=models.CASCADE,verbose_name='Produit')  
    lot = models.CharField(max_length=255)
    quantite_sage = models.PositiveIntegerField(verbose_name='quantite Sage')
    date_exp = models.DateField(verbose_name='Date exp.',null=True)
    prix_unitaire_sage = models.PositiveIntegerField(verbose_name="Prix Unitaire",default=0)
    mois = models.CharField(max_length=255,choices=MOIS_CHOICES)
    annee = models.CharField(max_length=255,choices=ANNEE_CHOICES)

    def get_absolute_url(self):
        return reverse('inventaire_list')

###########gestion Condom#####################################
# Create your models here.
class Province(models.Model):
    PROV_CHOICES =(
        ('bubanza','Bubanza'),
        ('bujumbura_mairie','Bujumbura Mairie'),        
       
    )
    nom = models.CharField(max_length=255,verbose_name='Province')
    
    def __str__(self):
        return self.nom

class CBonLivraison(BonLivraison,models.Model):
    province = models.ForeignKey(Province,on_delete=models.CASCADE)

""" class CBonSortie(Sortie,models.Model):
    province = models.ForeignKey(Province,on_delete=models.CASCADE) """

###########gestion Charge virale################################
# Create your models here.
class Site(models.Model):
    SITE_CHOICES =(
        ('anss','ANSS'),
        ('muyinga','Muyinga'),
        ('gitega','Gitega'),
        ('chuk','CHUK'),       
       
    )
    nom = models.CharField(max_length=255,verbose_name='Site')
    def __str__(self):
        return self.nom

class CVBonLivraison(BonLivraison,models.Model):
    site = models.ForeignKey(Site,on_delete=models.CASCADE)

""" class CVBonSortie(Sortie,models.Model):
    site = models.ForeignKey(Site,on_delete=models.CASCADE) """