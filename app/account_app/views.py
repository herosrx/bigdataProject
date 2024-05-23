__author__ = 'zhangbo'


from django.shortcuts import render,redirect

from django.http import HttpRequest,HttpResponse,HttpResponseRedirect,JsonResponse

from django.contrib import auth

from django.contrib.auth.decorators import login_required

from app.account_app.forms import UserRegisterForm,UserLoginForm

from app.account_app.models.userModels import User

from datetime import datetime

import time


# 判断用户登录的装饰器
def auth_zsq(func):

    def inner(request, *args, **kwargs):
        v = request.session.get('is_login', None)
        # print("v->",v)

        if v != True:

            return redirect('/user/login_bigdata/')

        return func(request, *args, **kwargs)

    return inner


#登录_1
def login_bigdata(request):

    if request.method == "GET":

        return render(request,"user/login.html")

    else:

        inp_username = request.POST.get('username','')
        inp_password = request.POST.get('password','')
        # print("inp_username->",inp_username)
        # print("inp_password->",inp_password)

        if inp_username == "" or inp_password == "":

            return render(request, 'user/login.html',
          {"account_info": "*该用户名或密码为空，请重新输入！！！"})

        user = auth.authenticate(username=inp_username,password=inp_password)
        # print("user->",user)

        if user is not None:

            #登录
            auth.login(request,user)

            request.session['is_login'] = True

            request.session['user'] = inp_username

            request.session.set_expiry(6000)

            #session
            response = HttpResponseRedirect('/home/bigdataPageHome/')

            return response

        else:

            try:

                username = User.objects.get(username=inp_username).username
                # print("username->",username)
                password = User.objects.get(username=inp_username).password
                # print("password->",password)

                if inp_username == username and inp_password == password:

                    request.session['is_login'] = True

                    request.session['user'] = username

                    request.session.set_expiry(6000)

                    return HttpResponseRedirect("/home/bigdataPageHome/")

                else:

                    return render(request, 'user/login.html',
                              {"account_info": "*该用户密码错误，请重新输入！！！"})

            except:

                return render(request, 'user/login.html',
                          {"account_info": "*该用户名错误，请重新输入！！！"})


#登录_2
def login_bigdata2(request):

    if request.method == "GET":

        login_obj = UserLoginForm()
        # print("login_obj->",login_obj)

        return render(request,"user/login_2.html",{'login_obj':login_obj})

    else:

        login_obj = UserLoginForm(request.POST)

        if login_obj.is_valid():

            inp_username = request.POST.get('username','')
            inp_password = request.POST.get('password','')
            print("inp_username->",inp_username)
            print("inp_password->",inp_password)

            try:

                user = auth.authenticate(username=inp_username,password=inp_password)
                print("user->",user)

                if user is not None:

                    #登录
                    auth.login(request,user)

                    request.session['is_login'] = True

                    request.session['user'] = inp_username

                    request.session.set_expiry(6000)

                    #session
                    response = HttpResponseRedirect('/home/bigdataPageHome/')

                    return response

                else:

                    try:

                        username = User.objects.get(username=inp_username).username
                        print("username->",username)
                        password = User.objects.get(username=inp_username).password
                        print("password->",password)

                        if inp_username == username and inp_password == password:

                            request.session['is_login'] = True

                            request.session['user'] = username

                            request.session.set_expiry(6000)

                            return HttpResponseRedirect("/home/bigdataPageHome/")

                        else:

                            return render(request, 'user/login_2.html',
                                      {"account_info": "*该用户密码错误，请重新输入！！！", 'login_obj': login_obj})

                    except:

                        return render(request, 'user/login_2.html',
                                  {"account_info": "该用户名错误！！！", 'login_obj': login_obj})

            except:

                    return render(request,'user/login_2.html',
                                  {'account_info': '系统错误！！！','login_obj': login_obj})



#注册
def register_bigdata(request):

    if request.method == "GET":

        return render(request,'user/register.html')

    else:

        username = request.POST.get("username","")
        password = request.POST.get("password","")
        mail     = request.POST.get("mail","")
        mobile   = request.POST.get("mobile","")

        if username == "":

            return render(request, 'user/register.html', {'username_error':"账户输入为空，请重新输入"})

        elif password == "":

            return render(request, 'user/register.html', {'password_error':"密码输入为空，请重新输入"})

        elif mail == "":

            return render(request, 'user/register.html', {'mail_error':"邮箱输入为空，请重新输入"})

        elif mobile == "":

            return render(request, 'user/register.html', {'mobile_error':"手机号输入为空，请重新输入"})

        try:

            if User.objects.get(username=username):

                return render(request,'user/register.html',
                              {"user_name_uplicate":"*注册用户名重复"})

        except:

            try:

                if User.objects.get(mail=mail):

                    return render(request,'user/register.html',
                      {"mail_uplicate":"*注册邮箱重复"})

            except:

                try:

                    if User.objects.get(mobile=mobile):

                        return render(request,'user/register.html',
                          {"mobile_uplicate":"*注册手机号重复"})

                except:

                    #获取系统当前时间+28800转换为当前时间
                    currery_now = datetime.utcfromtimestamp(time.time()+28800)
                    currery_now = currery_now.strftime('%Y-%m-%d %H:%M:%S')

                    User.objects.create(username=username,
                                        password=password,
                                        mail=mail,
                                        mobile=mobile,
                                        create_time=currery_now)

                    request.session['is_login'] = True

                    request.session['user'] = username

                    return HttpResponseRedirect("/home/bigdataPageHome/")


#注册_2
# def register_bigdata2(request):
#
#     register_obj = UserRegisterForm()
#
#     if request.method == "GET":
#
#         return render(request,'user/register_2.html',{'register_obj':register_obj})
#
#     else:
#
#         username = request.POST.get("username","")
#         password = request.POST.get("password","")
#         mail     = request.POST.get("mail","")
#         mobile   = request.POST.get("mobile","")
#
#         try:
#
#             if User.objects.get(username=username):
#
#                 return render(request,'user/register_2.html',
#                               {"user_name_uplicate":"*注册用户名重复",'register_obj':register_obj})
#
#         except:
#
#             try:
#
#                 if User.objects.get(mail=mail):
#
#                     return render(request,'user/register_2.html',
#                       {"mail_uplicate":"*注册邮箱重复",'register_obj':register_obj})
#
#             except:
#
#                 try:
#
#                     if User.objects.get(mobile=mobile):
#
#                         return render(request,'user/register_2.html',
#                           {"mobile_uplicate":"*注册手机号重复",'register_obj':register_obj})
#
#                 except:
#
#                     #获取系统当前时间+28800转换为当前时间
#                     currery_now = datetime.utcfromtimestamp(time.time()+28800)
#                     currery_now = currery_now.strftime('%Y-%m-%d %H:%M:%S')
#
#                     User.objects.create(username=username,
#                                         password=password,
#                                         mail=mail,
#                                         mobile=mobile,
#                                         create_time=currery_now)
#
#                     request.session['is_login'] = True
#
#                     request.session['user'] = username
#
#                     return HttpResponseRedirect("/home/bigdataPageHome/")
#












# 用户注册页
# def register(request):
#
#     '''
#     灵猫智能管理平台注册页
#     '''
#
#     register_obj = UserRegisterForm()
#
#     if request.method == "GET":
#
#         return render(request,'register_ccimp.html',{'register_obj':register_obj})
#
#     else:
#
#         get_user_name = request.POST.get("user_name","")
#         get_password  = request.POST.get("password","")
#         get_real_name = request.POST.get("real_name","")
#         get_mail      = request.POST.get("mail","")
#
#         if get_user_name == "":
#
#             return render(request, 'register_ccimp.html', {'name_error':"账户输入为空，请重新输入"})
#
#         elif get_password == "":
#
#             return render(request, 'register_ccimp.html', {'password_error':"密码输入为空，请重新输入"})
#
#         elif get_real_name == "":
#
#             return render(request, 'register_ccimp.html', {'real_name_error':"姓名输入为空，请重新输入"})
#
#         elif get_mail == "":
#
#             return render(request, 'register_ccimp.html', {'password_error':"邮件地址输入为空，请重新输入"})
#
#         else:
#
#             try:
#
#                 if User.objects.get(user_name=get_user_name):
#
#                     return render(request,'register_ccimp.html',
#                                   {"user_name_uplicate":"*注册账户重复",
#                                    'register_obj':register_obj})
#
#             except:
#
#                 try:
#
#                     if User.objects.get(mail=get_mail):
#
#                         return render(request,'register_ccimp.html',
#                           {"mail_uplicate":"*注册邮箱重复",'register_obj':register_obj})
#
#                 except:
#
#                     #获取系统当前时间判断
#                     currery_now = datetime.utcfromtimestamp(time.time()+28800)
#                     currery_now = currery_now.strftime('%Y-%m-%d %H:%M:%S')
#
#                     User.objects.create(user_name=get_user_name,
#                                         password=get_password,
#                                         real_name=get_real_name,
#                                         mail=get_mail,
#                                         create_time=currery_now)
#
#                     request.session['is_login'] = True
#
#                     request.session['user'] = get_user_name
#
#                     return HttpResponseRedirect("/project/")


# 退出系统
def logout_bigdata(request):

    request.session['is_login'] = False

    return HttpResponseRedirect("/user/login_bigdata/")


