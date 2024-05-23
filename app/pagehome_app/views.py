
from django.shortcuts import render
from app.account_app.views import auth_zsq


@auth_zsq
#首页
def page_home_bigdata(request):

    get_username = request.session.get('user','')

    if request.method == "GET":

        return render(request,"pageHome.html",{"username":get_username})