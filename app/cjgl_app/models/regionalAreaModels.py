#!/usr/bin/python
#encoding:utf-8


from django.db import models
from app.cjgl_app.models.areaModels import Area


class RegionalArea(models.Model):

      '''区域地段表'''

      area = models.ForeignKey(Area,on_delete=models.CASCADE)

      regional_area_zwm = models.CharField("区域地段中文名",max_length=100,null=False)

      regional_area_ywm = models.CharField("区域地段英文名",max_length=100,null=False)

      source_website = models.CharField("来源网站",max_length=200,null=False)

      source_link = models.CharField("来源链接",max_length=300,null=False)

      create_time = models.DateTimeField(null=False)

      update_time = models.DateTimeField(null=True)

      def __str__(self):

            return self.regional_area_zwm

