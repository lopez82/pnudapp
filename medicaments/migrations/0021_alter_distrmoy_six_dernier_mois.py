# Generated by Django 4.1 on 2022-10-22 14:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('medicaments', '0020_distrmoy_mois_distrmoy_six_dernier_mois_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='distrmoy',
            name='six_dernier_mois',
            field=models.JSONField(default={}),
        ),
    ]