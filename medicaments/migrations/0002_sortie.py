# Generated by Django 4.1 on 2022-09-01 11:17

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('medicaments', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Sortie',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('gestionnaire', models.CharField(blank=True, max_length=500, verbose_name='Nom gestionnaire')),
                ('num_sortie', models.CharField(blank=True, max_length=255, verbose_name='n bon de sortie')),
                ('quantite_sortie', models.PositiveIntegerField(verbose_name='quantite')),
                ('date_sortie', models.DateField(verbose_name='date sortie')),
                ('beneficiaire', models.CharField(blank=True, max_length=500, null=True, verbose_name='beneficiaire')),
                ('observation_sortie', models.CharField(blank=True, max_length=500, null=True, verbose_name='observation')),
                ('livraison', models.ForeignKey(default=2, on_delete=django.db.models.deletion.CASCADE, to='medicaments.bonlivraison')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
