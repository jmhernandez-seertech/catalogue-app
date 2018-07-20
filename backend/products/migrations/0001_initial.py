# -*- coding: utf-8 -*-
# Generated by Django 1.11.14 on 2018-07-12 06:55
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=100)),
                ('category', models.PositiveSmallIntegerField(choices=[(1, 'Shirts'), (2, 'Pants'), (3, 'Underwear')])),
                ('stock', models.IntegerField()),
                ('price', models.DecimalField(decimal_places=2, max_digits=10)),
                ('description', models.CharField(max_length=500, null=True)),
                ('imageUrl', models.CharField(max_length=500)),
            ],
        ),
    ]
