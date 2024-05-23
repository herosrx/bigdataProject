__author__ = 'zhangbo'

import django,os,json
os.environ.setdefault('DJANGO_SETTINGS_MODULE','bigdataProject.settings')
django.setup()


from random import choice,sample,randint
import operator

from app.cjgl_app.models.sourceCityModels import SourceCity


def getSourceCityInfo(source_id):

    source_city_list_1 = []
    source_city_data_dict_1 = {}

    source_city_xx = SourceCity.objects.filter(source_id=source_id)

    for c1 in source_city_xx:

        create_time = c1.create_time
        create_time = create_time.strftime("%Y-%m-%d %H:%M:%S")

        source_city_data_dict_1 = {

            "sourceId":c1.id,
            "sourceCity":c1.source_city,
            "sourceCityArea":c1.source_city_area,
            "sourceCityAreaRegional":c1.source_city_area_regional,
            "sourceLink":c1.source_link + "--" + c1.source_remarks,
            "sourceRemarks":c1.source_remarks,
            "createTime":create_time

        }

        source_city_list_1.append(source_city_data_dict_1)

    return source_city_list_1


if __name__ == '__main__':

    source_id = "1"
    result = getSourceCityInfo(source_id)
    # print("result-->",result)

    # result = json.dumps(result)
    print(result)