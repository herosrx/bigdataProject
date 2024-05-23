__author__ = 'zhangbo'

import django,os
os.environ.setdefault('DJANGO_SETTINGS_MODULE','bigdataProject.settings')
django.setup()


from random import choice,sample,randint
import operator

from app.cjgl_app.models.sourceModels import Source


def getSourceInfo():

    source_list_1 = []

    source_data_dict_1 = {}

    source_xx = Source.objects.all()

    for c1 in source_xx:

        source_data_dict_1 = {

            "sourceId":c1.id,
            "sourceData":c1.source_zwm,
            "sourceEngishData":c1.source_ywm,
            "sourceLink":c1.source_link,
            "sourceRemarks":c1.source_remarks,
            "createTime":c1.create_time
        }

        source_list_1.append(source_data_dict_1)

    return source_list_1


if __name__ == '__main__':

    result = getSourceInfo()
    print("result-->",result)