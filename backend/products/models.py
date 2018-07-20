from django.db import models
from django.urls import reverse

class Product(models.Model):
    SHIRTS = 1
    PANTS = 2
    UNDERWEAR = 3
    PRODUCT_CATEGORIES = (
        (SHIRTS, 'Shirts'),
        (PANTS, 'Pants'),
        (UNDERWEAR, 'Underwear'),
    )
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    category = models.PositiveSmallIntegerField(choices=PRODUCT_CATEGORIES)
    stock = models.IntegerField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    description = models.CharField(max_length=500, null=True)
    imageUrl = models.CharField(max_length=500)
