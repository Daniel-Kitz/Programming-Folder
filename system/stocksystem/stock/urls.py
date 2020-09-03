from django.conf.urls import url
from .views import *

urlpatterns = [

    url(r'^$', index, name='index'),
    url(r'^display_basen$', display_basen, name='display_basen'),
    url(r'^display_saeuren$', display_saeuren, name='display_saeuren'),
    url(r'^display_metalle$', display_metalle, name='display_metalle'),
    
    url(r'^add_basen$', add_basen, name='add_basen'),
    url(r'^add_saeuren$', add_saeuren, name='add_saeuren'),
    url(r'^add_metalle$', add_metalle, name='add_metalle')
]