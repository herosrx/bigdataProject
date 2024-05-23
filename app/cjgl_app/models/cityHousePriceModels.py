#!/usr/bin/python
#encoding:utf-8


from django.db import models
from app.cjgl_app.models.provinceCityModels import ProvinceCity
from app.cjgl_app.models.areaModels import Area
from app.cjgl_app.models.regionalAreaModels import RegionalArea


class CityHousePrice(models.Model):

      '''城市房价表'''

      province_city = models.ForeignKey(ProvinceCity,on_delete=models.CASCADE)

      area          = models.ForeignKey(Area,on_delete=models.CASCADE,null=True)

      regional_area = models.ForeignKey(RegionalArea,on_delete=models.CASCADE,null=True)

      city_zwm = models.CharField("城市中文名",max_length=100,null=False)

      year = models.CharField("年份",max_length=100,null=False)

      year_listing_price = models.CharField("年挂牌价格",max_length=100,null=False)

      month= models.CharField("月份",max_length=100,null=False)

      month_listing_price = models.CharField("月挂牌价格",max_length=100,null=False)

      day= models.CharField("日",max_length=100,null=False)

      day_listing_price = models.CharField("日挂牌价格",max_length=100,null=False)

      week= models.CharField("周",max_length=100,null=False)

      week_listing_price = models.CharField("周挂牌价格",max_length=100,null=False)

      bsy = models.CharField("比上月",max_length=100,null=False)

      bqn = models.CharField("比去年",max_length=100,null=False)

      source_website = models.CharField("来源网站",max_length=200,null=False)

      source_link = models.CharField("来源链接",max_length=300,null=False)

      cj_date = models.CharField("采集日期",max_length=300,null=False)

      create_time = models.DateTimeField(null=False)

      update_time = models.DateTimeField(null=True)

      def __str__(self):

            return self.city_zwm

