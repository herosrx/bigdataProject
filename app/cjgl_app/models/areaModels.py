#!/usr/bin/python
#encoding:utf-8


from django.db import models
from app.cjgl_app.models.provinceCityModels import ProvinceCity


class Area(models.Model):

      '''区域表'''

      province_city = models.ForeignKey(ProvinceCity,on_delete=models.CASCADE)

      # city_zwm = models.CharField("城市中文名",max_length=100,null=False)

      area_zwm = models.CharField("区域中文名",max_length=100,null=False)

      area_ywm = models.CharField("区域英文名",max_length=100,null=False)

      # permission_options = models.IntegerField("权限分类",default=2)

      source_website = models.CharField("来源网站",max_length=200,null=False)

      source_link = models.CharField("来源链接",max_length=300,null=False)

      create_time = models.DateTimeField(null=False)

      update_time = models.DateTimeField(null=True)

      def __str__(self):

            return self.area_zwm

