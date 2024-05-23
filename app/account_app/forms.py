#!/usr/bin/python
#encoding:utf-8


__author__ = 'zhangbo'


from django import forms
from django.forms import fields,widgets
from app.account_app.models.userModels import User


class UserLoginForm(forms.Form):

      username = fields.CharField(min_length=5,max_length=50)

      # password = fields.CharField(min_length=6,max_length=50)
      # 密码密文*输出
      password = fields.Field(widget=widgets.PasswordInput())

class UserRegisterForm(forms.Form):

      username = fields.CharField(min_length=5, max_length=50)

      # password = fields.CharField(min_length=6, max_length=50)
      # 密码密文*输出
      password = fields.Field(widget=widgets.PasswordInput())

      mail = fields.EmailField(min_length=7,max_length=200)

      mobile = fields.CharField(min_length=11,max_length=50)




# class UserLoginForm(forms.ModelForm):
#
#     class Meta:
#
#         model = User
#
#         fields = ['username', 'password',]


# class UserRegisterForm(forms.ModelForm):
#
#     class Meta:
#
#         model = User
#
#         fields = ['username', 'password', 'mail', 'mobile']