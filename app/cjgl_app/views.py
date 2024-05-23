from django.shortcuts import render
from app.account_app.views import auth_zsq

#采集数据首页
@auth_zsq
def cjdatamanage(request):

    get_username = request.session.get('user','')

    if request.method == "GET":

        return render(request,"cjDataPageHome.html",{"username":get_username})