#!/usr/bin/python
#encoding:utf-8


from django.db import models


class Source(models.Model):

      '''来源表'''

      source_zwm = models.CharField("来源中文名",max_length=100,null=False)

      source_ywm = models.CharField("来源英文名",max_length=100,null=True)

      # permission_options = models.IntegerField("权限分类",default=2)

      # source_website = models.CharField("来源网站",max_length=200,null=False)

      source_link = models.CharField("来源链接",max_length=500,null=True)

      source_remarks = models.TextField("来源备注",max_length=500,null=True)

      create_time = models.DateTimeField(null=False)

      update_time = models.DateTimeField(null=True)

      def __str__(self):

            return self.source_zwm

