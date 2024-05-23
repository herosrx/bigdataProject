__author__ = 'zhangbo'

import django,os
os.environ.setdefault('DJANGO_SETTINGS_MODULE','bigdataProject.settings')
django.setup()


from random import choice,sample,randint
import operator

from app.cjgl_app.models.provinceCityModels import ProvinceCity


def getProvince():

    province_list = []
    province_data_dict = {}

    province_xx = ProvinceCity.objects.all()
    # print("province_xx->",province_xx)

    for c1 in province_xx:

        if c1.sjdm == "0":

            province_data_dict = {

                "provinceData":c1.province_zwm,
                "provinceId":c1.id,
                "provinceDm":c1.dm,
                "provinceSjdm":c1.sjdm,
                "cityData":c1.city_zwm,

            }

            province_list.append(province_data_dict)

    return province_list


if __name__ == '__main__':

    result = getProvince()
    print("result-->",result)