__author__ = 'zhangbo'


from django.urls import path
from . import views


urlpatterns = [

    path('cjdata/',views.cjdatamanage),

]