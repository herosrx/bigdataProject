__author__ = 'zhangbo'


from django.urls import path
from . import views


urlpatterns = [

    path('bigdataPageHome/',views.page_home_bigdata),

]