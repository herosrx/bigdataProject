from django.shortcuts import render
from app.account_app.views import auth_zsq
from externalClass.api.getProvinceCityInfo import getProvinceCity
from externalClass.api.getProvinceInfo import getProvince
from externalClass.api.getCityInfo import getCityInfo
from externalClass.api.getCityAreaInfo import getCityAreaInfo
from externalClass.api.getCityRegionalAreaInfo import getCityRegionalAreaInfo
from externalClass.api.getCityHousePriceInfo import getCityHousePriceInfo
from externalClass.api.getSourceInfo import getSourceInfo
from externalClass.api.getSourceCityInfo import getSourceCityInfo

from django.http import JsonResponse



#采集数据首页
# @auth_zsq
def get_province_city_data_list(request):

    '''
    初始化省份和城市列表数据
    '''

    if request.method == "GET":

        p_id   = request.GET.get('sfId','')

        province_city_result_list = getProvinceCity()

        province_city_result_no = {}

        if province_city_result_list == ():

            province_city_result_no = {

                "info": "省份和城市，查询无结果",
            }

            return JsonResponse({"status": 10100, "message": "success", "data": province_city_result_no})

        else:

            return JsonResponse({"status": 10200, "message": "success", "data": province_city_result_list})


# @auth_zsq
def get_province_data_list(request):

    '''
    初始化省份列表数据
    '''

    if request.method == "GET":

        province_result_list = getProvince()

        province_result_no = {}

        if province_result_list == ():

            province_result_no = {

                "info": "省份查询无结果",
            }

            return JsonResponse({"status": 10100, "message": "success", "data": province_result_no})

        else:

            return JsonResponse({"status": 10200, "message": "success", "data": province_result_list})


# @auth_zsq
def get_city_data_list(request):

    '''
    初始化城市列表数据
    '''

    if request.method == "GET":

        p_id   = request.GET.get('sfId','')

        city_result_list = getCityInfo(p_id)

        city_result_no = {}

        if city_result_list == ():

            city_result_no = {

                "info": "城市查询无结果",
            }

            return JsonResponse({"status": 10100, "message": "success", "data": city_result_no})

        else:

            return JsonResponse({"status": 10200, "message": "success", "data": city_result_list})


# @auth_zsq
def get_city_area_data_list(request):

    '''
    初始化城市区域列表数据
    '''

    if request.method == "GET":

        c_id   = request.GET.get('cityId','')

        city_area_result_list = getCityAreaInfo(c_id)

        city_area_result_no = {}

        if city_area_result_list == ():

            city_area_result_no = {

                "info": "城市区域查询无结果",
            }

            return JsonResponse({"status": 10100, "message": "success", "data": city_area_result_no})

        else:

            return JsonResponse({"status": 10200, "message": "success", "data": city_area_result_list})


# @auth_zsq
def get_city_regional_area_data_list(request):

    '''
    初始化城市区域地段列表数据
    '''

    if request.method == "GET":

        a_id   = request.GET.get('areaId','')

        city_regional_area_result_list = getCityRegionalAreaInfo(a_id)

        city_regional_area_result_no = {}

        if city_regional_area_result_list == ():

            city_regional_area_result_no = {

                "info": "城市-区域-地段查询无结果",
            }

            return JsonResponse({"status": 10100, "message": "success", "data": city_regional_area_result_no})

        else:

            return JsonResponse({"status": 10200, "message": "success", "data": city_regional_area_result_list})






# @auth_zsq
def get_city_house_price_data_list(request):

    '''
    初始化城市房价列表数据
    '''

    if request.method == "GET":

        # p_id   = request.GET.get('province_id','')

        city_house_price_result_list = getCityHousePriceInfo()

        city_result_no = {}

        if city_house_price_result_list == ():

            city_house_price_result_no = {

                "info": "城市房价数据查询无结果",
            }

            return JsonResponse({"status": 10100, "message": "success", "data": city_house_price_result_no})

        else:

            return JsonResponse({"status": 10200, "message": "success", "data": city_house_price_result_list})


# @auth_zsq
def get_source_data_list(request):

    '''
    初始化来源列表数据
    '''

    if request.method == "GET":

        p_id   = request.GET.get('source_data','')

        source_result_list = getSourceInfo()

        source_result_no = {}

        if source_result_list == ():

            source_result_no = {

                "info": "来源查询无结果",
            }

            return JsonResponse({"status": 10100, "message": "success", "data": source_result_no})

        else:

            return JsonResponse({"status": 10200, "message": "success", "data": source_result_list})


# @auth_zsq
def get_source_city_data_list(request):

    '''
    初始化来源城市列表数据
    '''

    if request.method == "GET":

        lyxx_id   = request.GET.get('lyxxId','')

        source_city_result_list = getSourceCityInfo(lyxx_id)

        source_result_no = {}

        if source_city_result_list == ():

            source_city_result_no = {

                "info": "来源城市查询无结果",
            }

            return JsonResponse({"status": 10100, "message": "success", "data": source_city_result_no})

        else:

            return JsonResponse({"status": 10200, "message": "success", "data": source_city_result_list})

