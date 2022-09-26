from django.contrib import admin
from .models import  Site,Province,Categorie,Produit,Programme,Commande,EtatCommande,InventaireSage,ConsMoy,DistrMoy

admin.site.register(Site)
admin.site.register(Province)
admin.site.register(Categorie)
admin.site.register(Programme)
#admin.site.register(Produit)
admin.site.register(Commande)
admin.site.register(InventaireSage)
admin.site.register(ConsMoy)
admin.site.register(DistrMoy)

@admin.register(EtatCommande)
class EtatCommandeAdmin(admin.ModelAdmin):
    pass

@admin.register(Produit)
class ProductAdmin(admin.ModelAdmin):
    list_display =('designation','dashbord')

# Register your models here.
