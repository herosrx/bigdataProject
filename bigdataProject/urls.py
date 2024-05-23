"""bigdataProject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.contrib import admin
from django.urls import path,include
from app.account_app import views as account_view
from app.cjgl_app import cjdata_views as cjdata_views

urlpatterns = [

    path('admin/', admin.site.urls),
    path('', account_view.login_bigdata),
    path('accounts/login/', account_view.login_bigdata),
    path('accounts/register/', account_view.register_bigdata),

    #登录注册
    path('user/',include('account_app.urls')),

    #首页
    path('home/',include('pagehome_app.urls')),

    #采集管理
    path('cjgl/',include('cjgl_app.urls')),

    #api
    # path('api/cjgl/getProvinceCityDataList/', cjdata_views.get_province_city_data_list),

    #获取省份数据
    path('api/cjgl/getProvinceDataList/', cjdata_views.get_province_data_list),

    #获取城市数据
    path('api/cjgl/getCityDataList/', cjdata_views.get_city_data_list),

    #获取城市区域数据
    path('api/cjgl/getCityAreaDataList/', cjdata_views.get_city_area_data_list),

    #获取城市房价数据
    path('api/cjgl/getCityHousePriceDataList/', cjdata_views.get_city_house_price_data_list),

    #获取来源数据
    path('api/cjgl/getSourceDataList/', cjdata_views.get_source_data_list),

    #获取来源城市数据
    path('api/cjgl/getSourceCityDataList/', cjdata_views.get_source_city_data_list),


    # path('configmanage/ipDatabase/', account_view.ipDatabaseManage),
    # path('configmanage/kafkaDatabase/', account_view.kafkaDatabaseManage),
    # path('configmanage/solrDatabase/', account_view.solrDatabaseManage),
]


