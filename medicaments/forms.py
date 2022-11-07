#from pyexpat import model
#from tkinter import Widget
from random import choices
#from tkinter import Widget
from django.forms import ModelForm,inlineformset_factory,TextInput
from django import forms
#from bootstrap_datepicker_plus.widgets import DateTimePickerInput
from .models import BonLivraison, CoutUnitaire, DistrMoy, InventaireSage, Sortie, Categorie, EtatCommande,Commande, Partenaire,Produit
from medicaments import models


class ProduitForm(ModelForm):
    class Meta:
        model = Produit
        fields = ['designation','categorie','programme','num_ref','dashbord','classification','abbreviation','conditionnement','dosage','formulation'] 
    

class CoutUnitaireForm(ModelForm):
    class Meta:
        model = CoutUnitaire
        fields = ['cout','date_debut','date_fin']
    

CoutUnitaireInlineFormSet = inlineformset_factory(Produit,CoutUnitaire,form=CoutUnitaireForm,extra=1,can_delete=1,widgets ={            
            'date_debut':forms.TextInput(attrs={
                'class': 'form-control datainput','id':'datepicker1','data-provide':'datepicker'}),
            'date_fin':forms.TextInput(attrs={
                'class': 'form-control datainput','id':'datepicker2','data-provide':'datepicker'})

        })

class CommandeForm(ModelForm):    
    categorie = forms.ModelChoiceField(queryset=Categorie.objects.all())
    produit_commande = forms.ModelChoiceField(queryset=Produit.objects.all()) 
    #date_exp = forms.DateField(widget=forms.TextInput(attrs={'class': 'form-control datainput','id':'datepicker1','data-provide':'datepicker'}))
    date_livraison = forms.DateField(widget=forms.TextInput(attrs={'class': 'form-control datainput','id':'datepicker2','data-provide':'datepicker'}))
    partenaire = forms.ModelChoiceField(queryset=Partenaire.objects.all())
    class Meta:
        model = Commande
        fields =('categorie','produit_commande','lot_commande','quantite_commande','prix_unitaire','date_livraison','partenaire','observation')
        widgets ={
            'observation':forms.Textarea(attrs={
                'cols':10,'rows':5
            })
        }
class InventaireForm(ModelForm):    
    categorie = forms.ModelChoiceField(queryset=Categorie.objects.all())
    produit_inventaire = forms.ModelChoiceField(queryset=Produit.objects.all()) 
    date_exp = forms.DateField(widget=forms.TextInput(attrs={'class': 'form-control datainput','id':'datepicker1','data-provide':'datepicker'}))
   
    class Meta:
        model = InventaireSage
        fields =('categorie','produit_inventaire','lot','quantite_sage','date_exp','prix_unitaire_sage','mois','annee')
         
class BonLivraisonForm(ModelForm):
    commande = forms.ModelChoiceField(queryset=Commande.objects.all())
    date_exp = forms.DateField(widget=forms.TextInput(attrs={'class': 'form-control datainput','id':'datepicker3','data-provide':'datepicker'}))
    date_livraison = forms.DateField(widget=forms.TextInput(attrs={'class': 'form-control datainput','id':'datepicker4','data-provide':'datepicker'}))
    
    class Meta:
        model = BonLivraison
        fields = ('commande','fournisseur','num','quantite','date_livraison','date_exp','observation',)
        widgets ={
            'observation':forms.Textarea(attrs={
                'cols':10,'rows':5
            })
        }
class SortieForm(ModelForm):    
   
    #date_sortie = forms.DateField(widget=forms.TextInput(attrs={'class': 'form-control datainput','id':'datepicker3','data-provide':'datepicker'}))
    categorie = forms.ModelChoiceField(queryset=Categorie.objects.all())
    date_sortie = forms.DateField(widget=forms.TextInput(attrs={'class': 'form-control datainput','id':'datepicker1','data-provide':'datepicker'}))
    produit_sortie = forms.ModelChoiceField(queryset=Produit.objects.all())    
    
    
    class Meta:
        model = Sortie
        fields = ('categorie','produit_sortie','lot_sortie','quantite_sortie','date_sortie','observation_sortie',)
        widgets ={
            'observation_sortie':forms.Textarea(attrs={
                'cols':10,'rows':5
            }),
            'date_sortie':forms.TextInput(attrs={
                'class': 'form-control datainput','id':'datepicker1','data-provide':'datepicker'})

        }

class DmmForm(ModelForm): 
   
    categorie = forms.ModelChoiceField(queryset=Categorie.objects.all())
    produit = forms.ModelChoiceField(queryset=Produit.objects.all(),widget=forms.Select(attrs={'class':'input_six_mois'})) 
    #annee = forms.IntegerField(widget=forms.Select(attrs={'class':'input_six_mois'},choices=ANNEE_CHOICES))
    #mois = forms.IntegerField(widget=forms.Select(attrs={'class':'input_six_mois'},choices=MOIS_CHOICES))
    
    class Meta:
        model = DistrMoy
        fields =('categorie','produit','annee','mois','value')
        



