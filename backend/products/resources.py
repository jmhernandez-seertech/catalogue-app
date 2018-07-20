from tastypie.resources import ModelResource
from products.models import Product
from tastypie.authorization import Authorization


class ProductResource(ModelResource):
    class Meta:
        queryset = Product.objects.all()
        allowed_methods = ['get', 'put', 'post']
        resource_name = 'products'
        collection_name = 'data'
        include_resource_uri = False
        authorization = Authorization()
