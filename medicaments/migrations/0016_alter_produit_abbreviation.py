# Generated by Django 4.1 on 2022-10-15 17:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('medicaments', '0015_conditionnement_dosage_formulation_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='produit',
            name='abbreviation',
            field=models.CharField(default='', max_length=255, null=True, verbose_name='abreviation'),
        ),
    ]
