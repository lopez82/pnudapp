from pyexpat import model
#from tkinter import Widget
from django.forms import ModelForm,inlineformset_factory,TextInput
from django import forms
#from bootstrap_datepicker_plus.widgets import DateTimePickerInput
from .models import BonLivraison, InventaireSage, Sortie, Categorie, EtatCommande,Commande, Partenaire,Produit
from medicaments import models

     
class CommandeForm(ModelForm):    
    categorie = forms.ModelChoiceField(queryset=Categorie.objects.all())
    produit_commande = forms.ModelChoiceField(queryset=Produit.objects.all()) 
    date_exp = forms.DateField(widget=forms.TextInput(attrs={'class': 'form-control datainput','id':'datepicker1','data-provide':'datepicker'}))
    date_livraison = forms.DateField(widget=forms.TextInput(attrs={'class': 'form-control datainput','id':'datepicker2','data-provide':'datepicker'}))
    partenaire = forms.ModelChoiceField(queryset=Partenaire.objects.all())
    class Meta:
        model = Commande
        fields =('categorie','produit_commande','lot_commande','quantite_commande','prix_unitaire','date_exp','date_livraison','partenaire','observation')
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



