from .models import Commande,EtatCommande
def livraison_post_save(sender,instance,created,*args,**kwargs):
    if created:
        commande = Commande.objects.get(id =instance.commande.id)
        etat_commande =EtatCommande.objects.get(id=3)
        commande.etat_commande = etat_commande
        commande.save()
        #instance.commande.objects.update('etat_commande',3)

def livraison_post_delete(sender,instance,**kwargs):    
    commande = Commande.objects.get(id =instance.commande.id)
    etat_commande =EtatCommande.objects.get(id=1)
    commande.etat_commande = etat_commande
    commande.save()