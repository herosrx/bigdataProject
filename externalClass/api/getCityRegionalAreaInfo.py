__author__ = 'zhangbo'

import django,os
os.environ.setdefault('DJANGO_SETTINGS_MODULE','bigdataProject.settings')
django.setup()


from random import choice,sample,randint
import operator

from app.cjgl_app.models.regionalAreaModels import RegionalArea


def getCityRegionalAreaInfo(a_id):

    city_regional_area_list_1 = []

    city_regional_area_data_dict_1 = {}

    city_regional_area_1 = RegionalArea.objects.filter(area_id=a_id)

    for c1 in city_regional_area_1:

        create_time = c1.create_time
        create_time = create_time.strftime("%Y-%m-%d %H:%M:%S")

        city_regional_area_data_dict_1 = {

            "regionalAreaId":c1.id,
            "regionalAreaData":c1.regional_area_zwm,
            "regionalAreaDataYwm":c1.regional_area_ywm,
            "sourceWebsite":c1.source_website,
            "sourceLink":c1.source_link,
            "createTime":create_time,
            "areaId":c1.area_id

        }

        city_regional_area_list_1.append(city_regional_area_data_dict_1)

    return city_regional_area_list_1


if __name__ == '__main__':

    a_id = 1

    result = getCityRegionalAreaInfo(a_id)
    print("result-->",result)
