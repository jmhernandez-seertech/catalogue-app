from django.conf.urls import url, include
from products.resources import ProductResource
from . import views

product_resource = ProductResource()

urlpatterns = [
    url(r'^$', include(product_resource.urls)),
]
