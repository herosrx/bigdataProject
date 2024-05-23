#!/usr/bin/python
#encoding:utf-8


from django.db import models
from app.cjgl_app.models.sourceModels import Source


class SourceCity(models.Model):

      '''来源网址表'''

      source = models.ForeignKey(Source,on_delete=models.CASCADE)

      source_city = models.CharField("来源城市名称",max_length=100,null=False)

      source_city_area = models.CharField("来源城市区域名称",max_length=100,null=True)

      source_city_area_regional = models.CharField("来源城市区域地段名称",max_length=100,null=True)

      # permission_options = models.IntegerField("权限分类",default=2)

      # source_website = models.CharField("来源网站",max_length=200,null=False)

      source_link = models.CharField("来源链接",max_length=500,null=False)

      source_remarks = models.TextField("来源城市备注",max_length=500,null=True)

      create_time = models.DateTimeField(null=False)

      update_time = models.DateTimeField(null=True)

      def __str__(self):

            return self.source_city

