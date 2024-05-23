__author__ = 'zhangbo'

import django,os,json
os.environ.setdefault('DJANGO_SETTINGS_MODULE','bigdataProject.settings')
django.setup()


from random import choice,sample,randint
import operator

from app.cjgl_app.models.cityHousePriceModels import CityHousePrice


def getCityHousePriceInfo():

    city_house_list_1 = []
    city_house_dict_1 = {}

    city_house_price_xx = CityHousePrice.objects.all()
    # print("city_house_price_xx",city_house_price_xx)

    for cityhouse_data in city_house_price_xx:

        create_time = cityhouse_data.create_time
        create_time = create_time.strftime("%Y-%m-%d %H:%M:%S")

        city_house_dict_1 = {

            "city":cityhouse_data.city_zwm,
            "year":cityhouse_data.year,
            "year_listing_price":cityhouse_data.year_listing_price,
            "month":cityhouse_data.month,
            "month_listing_price":cityhouse_data.month_listing_price,
            "day":cityhouse_data.day,
            "day_listing_price":cityhouse_data.day_listing_price,
            "week":cityhouse_data.week,
            "week_listing_price":cityhouse_data.week_listing_price,
            "bsy":cityhouse_data.bsy,
            "bqn":cityhouse_data.bqn,
            "source_website":cityhouse_data.source_website,
            "source_link":cityhouse_data.source_link,
            "cj_date":cityhouse_data.cj_date,
            "create_time":create_time,
            "province_city_id":cityhouse_data.province_city_id,
            "area_id":cityhouse_data.area_id,
            "regional_area_id":cityhouse_data.regional_area_id,

        }

        city_house_list_1.append(city_house_dict_1)

    # dm = province_1.dm
    # city_1 = province_1.city_zwm
    # sjdm_1 = province_1.sjdm

    # if city_1 == "北京" and sjdm_1 == "0" or \
    #    city_1 == "天津" and sjdm_1 == "0" or \
    #    city_1 == "深圳" and sjdm_1 == "0" or \
    #    city_1 == "广州" and sjdm_1 == "0" or \
    #    city_1 == "上海" and sjdm_1 == "0":
    #
    #     province_city_xx1 = ProvinceCity.objects.filter(dm=dm)
    #
    #     for c1 in province_city_xx1:
    #
    #         city_data_dict_1 = {
    #
    #             "cityData":c1.city_zwm,
    #             "provinceData":c1.province_zwm,
    #             "provinceId":c1.id,
    #             "provinceDm":c1.dm,
    #
    #         }
    #
    #         city_list_1.append(city_data_dict_1)
    #
    # else:
    #
    #     province_city_xx2 = ProvinceCity.objects.filter(sjdm=dm)
    #
    #     for c1 in province_city_xx2:
    #
    #         city_data_dict_2 = {
    #
    #             "cityData":c1.city_zwm,
    #             "citySjdm":c1.sjdm,
    #             "provinceData":c1.province_zwm,
    #             "provinceId":c1.id,
    #             "provinceDm":c1.dm,
    #         }
    #
    #         city_list_1.append(city_data_dict_2)

    return city_house_list_1


if __name__ == '__main__':

    city = "北京"

    result = getCityHousePriceInfo()
    print("result-->",result)
    print(type(result))

    r1 = json.dumps(result)
    print(r1)
    print(type(r1))
