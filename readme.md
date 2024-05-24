|-- bigdataProject
|   |-- __init__.py
|   |-- asgi.py        #一个 ASGI 兼容的 Web 服务器的入口，以便运行你的项目。
|   |-- settings.py    #该 Django 项目的设置/配置
|   |-- urls.py        #该 Django 项目的 URL 声明; 一份由 Django 驱动的网站"目录"
|   `-- wsgi.py        #一个 WSGI 兼容的 Web 服务器的入口，以便运行你的项目。
`-- manage.py          #django 项目入口文件



启动程序：python manage.py runserver 0.0.0.0:8000

后台用户名密码：admin / 1234qwer


-----API LIST---------
    #登录注册
    http://127.0.0.1:8000/user/

    #首页
    http://127.0.0.1:8000/home/

    #采集管理
    http://127.0.0.1:8000/cjgl/

    #api
    http://127.0.0.1:8000/api/cjgl/getProvinceCityDataList/

    #获取省份数据
    http://127.0.0.1:8000/api/cjgl/getProvinceDataList/

    #获取城市数据
    http://127.0.0.1:8000/api/cjgl/getCityDataList/

    #获取城市区域数据
    http://127.0.0.1:8000/api/cjgl/getCityAreaDataList/

    #获取城市区域地段数据
    http://127.0.0.1:8000/api/cjgl/getCityRegionalAreaDataList/

    #获取城市房价数据
    http://127.0.0.1:8000/api/cjgl/getCityHousePriceDataList/

    #获取来源数据
    http://127.0.0.1:8000/api/cjgl/getSourceDataList/
    #获取来源城市数据
    http://127.0.0.1:8000/api/cjgl/getSourceCityDataList/
