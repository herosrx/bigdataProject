__author__ = 'zhangbo'

import django,os,re,datetime,time
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin

os.environ.setdefault('DJANGO_SETTINGS_MODULE','bigdataProject.settings')
django.setup()

import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin

from random import choice,sample,randint
import operator

from app.cjgl_app.models.provinceCityModels import ProvinceCity
from app.cjgl_app.models.cityHousePriceModels import CityHousePrice


def cjCityHousePriceData(p_id,url):

    bsy_data = ""
    bqn_data = ""
    gpjj_data = ""

    province_xx = ProvinceCity.objects.get(id=p_id)
    # city_data   = province_xx.city_zwm
    # source_website_data   = province_xx.source_website
    # source_link_data = province_xx.source_link


    headers = {

        "User-Agent":"Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)",
        "HOST":"www.httpbin.org"
    }

    response = requests.get(url,headers)
    # print(response.text)

    soup = BeautifulSoup(response.text,'html.parser')
    # print(soup)
    # print (soup.prettify())

    #查找全部
    str2_text = soup.find_all('div',{"class":"price-item"})
    # str2_text = soup.find_all('div',{"class":"cell"})
    print("str2_text->",str2_text)

    for dive_ in str2_text:

        div_class = dive_.get_text()
        print("div_class->",div_class)

        div_text = div_class.strip()
        print("div_text->",div_text)

        if "%" in div_text:

            if "比上月" in div_class:

                bsy_data = div_text.split("%")[0]
                print("bsy_data->",bsy_data)

            elif "比去年" in div_class:

                bqn_data = div_text.split("%")[0]
                print("bqn_data->",bqn_data)

        elif "5月" in div_text:

                gpjj_data = div_text.split("元")[0]
                print("gpjj_data->",gpjj_data)

    city_house_price_data = []
    city_house_price_data = {}


    currery_now = datetime.datetime.utcfromtimestamp(time.time()+28800)
    # print ("currery_now-->",currery_now,type(currery_now))
    currery_now = currery_now.strftime('%Y-%m-%d %H:%M:%S')
    # print ("currery_now-->",currery_now,type(currery_now))

    CityHousePrice.objects.create(city_zwm            ="北京",
                                  year                ="2024",
                                  year_listing_price  ="52160",
                                  month               ="05",
                                  month_listing_price =gpjj_data,
                                  day                 ="18",
                                  day_listing_price   =gpjj_data,
                                  week                ="05-12",
                                  week_listing_price  =gpjj_data,
                                  bsy                 =bsy_data,
                                  bqn                 =bqn_data,
                                  source_website      ="安居客",
                                  source_link         ="https://beijing.anjuke.com/market/",
                                  cj_date             ="2024-05-18",
                                  create_time         =currery_now,
                                  province_city_id    =province_xx.id,
                                  area_id             ="",
                                  regional_area_id    ="",
                                  )


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
    #
    # return city_list_1


if __name__ == '__main__':

    p_id = 1
    target_url = 'https://beijing.anjuke.com/market/'
    result = cjCityHousePriceData(p_id,target_url)
    print("result-->",result)