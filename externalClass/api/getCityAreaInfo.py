__author__ = 'zhangbo'

import django,os
os.environ.setdefault('DJANGO_SETTINGS_MODULE','bigdataProject.settings')
django.setup()


from random import choice,sample,randint
import operator

from app.cjgl_app.models.areaModels import Area


def getCityAreaInfo(c_id):

    city_area_list_1 = []

    city_area_data_dict_1 = {}

    city_area_1 = Area.objects.filter(province_city_id=c_id)

    for c1 in city_area_1:

        create_time = c1.create_time
        create_time = create_time.strftime("%Y-%m-%d %H:%M:%S")

        city_area_data_dict_1 = {

            "areaId":c1.id,
            "areaData":c1.area_zwm,
            "areaDataYwm":c1.area_ywm,
            "sourceWebsite":c1.source_website,
            "sourceLink":c1.source_link,
            "createTime":create_time,
            "provinceCityId":c1.province_city_id

        }

        city_area_list_1.append(city_area_data_dict_1)

    return city_area_list_1


if __name__ == '__main__':

    c_id = 1

    result = getCityAreaInfo(c_id)
    print("result-->",result)