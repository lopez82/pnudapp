# Generated by Django 4.1 on 2022-09-10 16:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('medicaments', '0009_alter_produit_categorie'),
    ]

    operations = [
        migrations.AddField(
            model_name='commande',
            name='lot_commande',
            field=models.CharField(blank=True, max_length=500, null=True, verbose_name='lot'),
        ),
        migrations.AddField(
            model_name='sortie',
            name='lot_sortie',
            field=models.CharField(blank=True, max_length=500, null=True, verbose_name='lot'),
        ),
    ]
