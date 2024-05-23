__author__ = 'zhangbo'

import django,os
os.environ.setdefault('DJANGO_SETTINGS_MODULE','bigdataProject.settings')
django.setup()


from random import choice,sample,randint
import operator

from app.cjgl_app.models.provinceCityModels import ProvinceCity


def getProvinceCity():

    city_list_1 = []

    province_city_list1 = []
    province_city_list2 = []
    province_data_dict1 = {}
    city_data_dict1 = {}
    city_data_dict_2 = {}

    p1_data = {}

    province_xx = ProvinceCity.objects.all()

    for c1 in province_xx:

        if c1.sjdm == "0":

            province_xx1 = ProvinceCity.objects.get(id=c1.id)
            dm = province_xx1.dm
            city_1 = province_xx1.city_zwm
            sjdm_1 = province_xx1.sjdm

            if city_1 == "北京" and sjdm_1 == "0" or \
               city_1 == "天津" and sjdm_1 == "0" or \
               city_1 == "深圳" and sjdm_1 == "0" or \
               city_1 == "广州" and sjdm_1 == "0" or \
               city_1 == "上海" and sjdm_1 == "0":

                province_city_xx1 = ProvinceCity.objects.filter(dm=dm)

                for c1 in province_city_xx1:

                    city_data_dict_1 = {

                        "cityData":c1.city_zwm,
                        "provinceData":c1.province_zwm,
                        "provinceId":c1.id,
                        "provinceDm":c1.dm,
                        "provinceSjdm":c1.sjdm
                    }

                    city_list_1.append(city_data_dict_1)

            else:

                province_city_xx2 = ProvinceCity.objects.filter(sjdm=dm)

                for c1 in province_city_xx2:

                    city_data_dict_2 = {

                        "cityData":c1.city_zwm,
                        "citySjdm":c1.sjdm,
                        "provinceData":c1.province_zwm,
                        "provinceId":c1.id,
                        "provinceDm":c1.dm,
                        "provinceSjdm":c1.sjdm

                    }

                    city_list_1.append(city_data_dict_2)

    return city_list_1



    # province_city_list1 = []
    # province_city_list2 = []
    # province_data_dict1 = {}
    # city_data_dict1 = {}
    #
    # province_xx = ProvinceCity.objects.all()
    #
    # for c1 in province_xx:
    #
    #     if c1.sjdm == "0":
    #
    #         province_xx1 = ProvinceCity.objects.filter()
    #
    #         province_data_dict1 = {
    #
    #             "cityData":c1.city_zwm,
    #             "provinceData":c1.province_zwm,
    #             "provinceId":c1.id,
    #             "provinceDm":c1.dm,
    #             "provinceSjdm":c1.sjdm
    #         }
    #
    #         province_city_list1.append(province_data_dict1)
    #
    #         city_xx = ProvinceCity.objects.filter(id=c1.id)
    #
    #         for c2 in city_xx:
    #
    #             if c2.city_zwm == "北京" or c2.city_zwm == "天津" or c2.city_zwm == "深圳" or c2.city_zwm == "广州" or c2.city_zwm == "上海":
    #
    #                 city_data_dict1 = {
    #
    #                     "cityData":c2.city_zwm,
    #                     "provinceData":c2.province_zwm,
    #                     "provinceId":c2.id,
    #                     "provinceDm":c1.dm,
    #                     # "provinceSjdm":c1.sjdm,
    #
    #                 }
    #
    #                 province_city_list2.append(city_data_dict1)
    #
    #
    #             else:
    #
    #                 city2_xx = ProvinceCity.objects.filter(sjdm=c1.dm)
    #
    #                 for c3 in city2_xx:
    #
    #                     city_data_dict2 = {
    #
    #                         "cityData":c3.city_zwm,
    #                         "citySjdm":c3.sjdm,
    #                         "provinceData":c3.province_zwm,
    #                         "provinceId":c3.id,
    #                         "provinceDm":c3.dm,
    #                     }
    #
    #                     province_city_list2.append(city_data_dict2)
    #
    # province_city_list = province_city_list1 + province_city_list2
    #
    # return province_city_list



if __name__ == '__main__':

    result = getProvinceCity()
    print("result-->",result)