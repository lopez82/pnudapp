from django.contrib import admin
from .models import  Site,Province,Categorie,Produit,Programme,Commande,EtatCommande,InventaireSage,ConsMoy,DistrMoy,Dosage,Formulation,Conditionnement,Classification

admin.site.register(Site)
admin.site.register(Province)
admin.site.register(Categorie)
admin.site.register(Programme)
admin.site.register(Classification)
admin.site.register(Commande)
admin.site.register(InventaireSage)
#admin.site.register(ConsMoy)
admin.site.register(DistrMoy)
admin.site.register(Dosage)
admin.site.register(Formulation)
admin.site.register(Conditionnement)

@admin.register(EtatCommande)
class EtatCommandeAdmin(admin.ModelAdmin):
    pass

@admin.register(Produit)
class ProductAdmin(admin.ModelAdmin):
    list_display =('designation','dashbord')

@admin.register(ConsMoy)
class ConsMoyAdmin(admin.ModelAdmin):
    list_display = ('produit','get_categorie','annee','value')
    list_filter = ('produit','produit__categorie','annee')
    
    def get_categorie(self,obj):
        return obj.produit.categorie.nom
    #get_categorie.admin_order_field = 'categorie'
    get_categorie.short_description = 'Categorie'

# Register your models here.
