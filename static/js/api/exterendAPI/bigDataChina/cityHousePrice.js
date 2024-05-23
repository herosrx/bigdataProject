/**
 * Created by zhangbo on 2024/05/20.
 */

//------------------------------------select2 js二级联动菜单------------------------------------//

//初始化 “城市房价列表”
var SelectCityHousePriceInit = function (province_id) {

    var sf_xx            = document.getElementById("sf_id");
    var city_xx          = document.getElementById("city_id");
    var area_xx          = document.getElementById("area_id");
    var regional_area_xx = document.getElementById("regional_area_id");
    var CityHousePriceDataList = [];
    var sf_id;
    var city_id;
    var j_city_id;

    //清除数据下拉选项
    function clearAreaAegionalDataOption(cmb) {

        l_sum = cmb.length;

        for (i = 0; i <= l_sum; i++) {

            cmb.options.remove(cmb[i]);

        }
    }

    //创建城市下拉选项
    function addCityOption(Sf,obj) {

        // 创建option标签元素
        var option = document.createElement("option");

        // 添加option到选项
        Sf.options.add(option);

        // 元素值
        //option.innerHTML = obj.provinceId;
        option.innerHTML = obj.cityData;

        // 元素value值
        option.value = obj.provinceId;

    }

    //设置下拉选项默认值
    function setDefaultOption(cmb,option_mc) {

        // 清除之前次对象关系下拉数据
        clearAreaAegionalDataOption(cmb);

        // 创建option标签元素
        var init_option = document.createElement("option");
        //var text_book3_init_option = document.createElement("option");

        // 添加option到选项
        cmb.options.add(init_option);
        //cmbSetDefaultOption3.options.add(text_book3_init_option);

        // 元素值
        init_option.innerHTML = option_mc;
        //text_book3_init_option.innerHTML = "请选择";

        // 元素value值
        init_option.value = "0";
        //text_book3_init_option.value = "0";

    }

    //改变城市list数据
    function changeCityData() {

        if (city_xx.selectedIndex === -1) {

            return;
        }

        if (city_xx.selectedIndex === 0){

            //清除之前区域、地段下拉数据
            clearAreaAegionalDataOption(area_xx);
            clearAreaAegionalDataOption(regional_area_xx);

            //设置区域、地段默认选项
            setDefaultOption(area_xx,"请选择区域");
            setDefaultOption(regional_area_xx,"请选择地段");

        }

        j_city_id = city_xx.options[city_xx.selectedIndex].value;
        city_id = j_city_id;

        //清除之前区域、地段下拉数据
        clearAreaAegionalDataOption(area_xx);
        clearAreaAegionalDataOption(regional_area_xx);

        //设置之前区域、地段默认选项
        setDefaultOption(area_xx,"请选择区域");
        setDefaultOption(regional_area_xx,"请选择地段");

        //调用区域
        //SelectAreaInit(city_id);

    }

    //调取城市房价数据列表
    function getSelectCityHousePriceData() {

        $.get('/api/cjgl/getCityHousePriceDataList/', {

            //"province_id":province_id

        }, function (resp) {

            CityHousePriceDataList = resp.data;

            if (resp.status === 10200) {

                //console.log(CityHousePriceDataList);
                //for (var i = 0; i < CityHousePriceDataList.length; i++) {

                    //data1 = JSON.stringify(CityHousePriceDataList[i]);
                    //alert(data1);
                    //console.log(data1);
                //}


            }

            else {

                console.log("城市房价数据查询无结果：", CityHousePriceDataList);

            }

        });
    }

    getSelectCityHousePriceData();

};
