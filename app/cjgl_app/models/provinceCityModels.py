#!/usr/bin/python
#encoding:utf-8


from django.db import models


class ProvinceCity(models.Model):

      '''省份城市表'''

      province_zwm = models.CharField("省份中文名",max_length=100,null=False)

      province_ywm = models.CharField("省份英文名",max_length=100,null=False)

      city_zwm = models.CharField("城市中文名",max_length=100,null=False)

      city_ywm = models.CharField("城市英文名",max_length=100,null=False)

      dm    = models.CharField("省份城市代码",max_length=100,null=False)

      sjdm  = models.CharField("上级代码",max_length=100,null=True)

      # permission_options = models.IntegerField("权限分类",default=2)

      source_website = models.CharField("来源网站",max_length=200,null=False)

      source_link = models.CharField("来源链接",max_length=300,null=True)

      create_time = models.DateTimeField(null=False)

      update_time = models.DateTimeField(null=True)


      def __str__(self):

            return self.province_zwm

