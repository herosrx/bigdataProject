__author__ = 'zhangbo'


import requests

from flask import Flask


r1 = requests.get(url="http://192.168.5.54:5000/")
print(r1)
print(r1.text)