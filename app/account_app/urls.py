__author__ = 'zhangbo'




from django.urls import path
from . import views


urlpatterns = [

    path('login_bigdata/',views.login_bigdata),

    path('register_bigdata/',views.register_bigdata),

    path('logout_bigdata/',views.logout_bigdata),

]


