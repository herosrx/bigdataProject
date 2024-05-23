__author__ = 'zhangbo'

import django,os
os.environ.setdefault('DJANGO_SETTINGS_MODULE','bigdataProject.settings')
django.setup()


from random import choice,sample,randint
import operator

from app.cjgl_app.models.provinceCityModels import ProvinceCity


def getCityInfo(p_id):

    city_list_1 = []
    city_data_dict_1 = {}
    city_data_dict_2 = {}

    province_1 = ProvinceCity.objects.get(id=p_id)
    dm = province_1.dm
    city_1 = province_1.city_zwm
    sjdm_1 = province_1.sjdm

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
            }

            city_list_1.append(city_data_dict_2)

    return city_list_1


if __name__ == '__main__':

    p_id = 3
    # p_id = 7
    # p_id = 2
    # p_id = 5
    # city_xx = ProvinceCity.objects.filter(sjdm=dm)
    # print(city_xx)

    result = getCityInfo(p_id)
    print("result-->",result)