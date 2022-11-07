"""gestionMedProj URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from .views import DmmCreateView, DmmListView, DmmUpdateView, InventaireProduitListView, InventaireCreateView, InventaireUpdateView, LivraisonUpdateView, ProduitCreateView,ProduitListView, delete_commande, delete_inventaire, get_ajax_dernier_six_mois, get_ajax_gauge, get_ajax_msd_produit, home,home_dmm,CommandeCreateView,CommandeListView,CommandeUpdateView,BonLivraisonCreateView,LivraisonListView,LivraisonUpdateView,SortieCreateView,SortieListView,SortieUpdateView,InventaireListView,ProduitUpdateView,produit_delete,sortie_delete,livraison_delete,get_products_ajax,get_ajax_line,delete_dmm

urlpatterns = [
   path('', home,name='home'), 
   
    #########produits URL ####
    path('produits/', ProduitListView.as_view(),name='produit_list'),  
    path('produits/create', ProduitCreateView.as_view(),name='produit_form'),
    path('produits/<int:pk>/update', ProduitUpdateView.as_view(),name='produit_update'),
    path('produits/<int:pk>/delete', produit_delete,name='produit_delete'),
    path('produits/api/msd_produit/', get_ajax_msd_produit,name='get_ajax_msd_produit'),
    path('produits/api/gauge_produit/', get_ajax_gauge,name='get_ajax_gauge'),  
    path('produits/api/dmm_produit/', get_ajax_line,name='get_ajax_line'), 
   
   
    path('<int:categorie>', home,name='home'),
    path('dmm/<int:categorie>', home_dmm,name='home_dmm'),#dashbord page for dmm
    path('commandes/create', CommandeCreateView.as_view(),name='commande_form'),
    path('commandes/<int:pk>/update', CommandeUpdateView.as_view(),name='commande_update'),   
    path('commandes/<int:pk>/delete', delete_commande,name='delete_commande'),    
    path('commandes/list', CommandeListView.as_view(),name='commande_list'),  
      
    
    path('commandes/get_products_ajax', get_products_ajax,name='get-products-ajax'),
    ####livraison url
    path('livraison/create',BonLivraisonCreateView.as_view(),name='livraison_form'),
    path('livraison/list', LivraisonListView.as_view(),name='livraison_list'), 
    path('livraison/<int:pk>/update', LivraisonUpdateView.as_view(),name='livraison_update'),   
    path('livraison/<int:pk>/delete', livraison_delete,name='livraison_delete'),   
    ####sortie url 
    path('sortie/create',SortieCreateView.as_view(),name='sortie_form'),
    path('sortie/list', SortieListView.as_view(),name='sortie_list'), 
    path('sortie/<int:pk>/update', SortieUpdateView.as_view(),name='sortie_update'),   
    path('sortie/<int:pk>/delete', sortie_delete,name='sortie_delete'),
    #########Inventaire urls
    path('inventaires/create', InventaireCreateView.as_view(),name='inventaire_form'),
    path('inventaires/<int:pk>/update', InventaireUpdateView.as_view(),name='inventaire_update'),   
    path('inventaires/<int:pk>/delete', delete_inventaire,name='delete_inventaire'),    
    path('inventaires/list', InventaireListView.as_view(),name='inventaire_list'),  
    path('inventaires/<int:produit_id>/<int:mois>/<int:annee>', InventaireProduitListView.as_view(),name='inventaire_produit_list'),


    path('params/dmm', DmmListView.as_view(),name='dmm_list'), 
    path('params/dmm/create', DmmCreateView.as_view(),name='dmm_form'), 
    path('params/dmm/get_ajax_dernier_six_mois', get_ajax_dernier_six_mois,name='get-ajax-dernier-six-mois'),
    path('params/dmm/<int:pk>/update', DmmUpdateView.as_view(),name='dmm_update'), 
    path('params/dmm/<int:pk>/delete', delete_dmm,name='delete_dmm'),
    
]
