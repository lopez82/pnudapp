# Generated by Django 4.1 on 2022-09-02 16:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('medicaments', '0006_rename_lot_commande_rename_lot_bonlivraison_commande_and_more'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='produit',
            options={'ordering': ['designation']},
        ),
        migrations.AddField(
            model_name='produit',
            name='dashbord',
            field=models.BooleanField(default=0),
        ),
    ]
