/**
 * Created by zhangbo on 2024/05/23.
 */

//------------------------------------select2 js二级联动菜单------------------------------------//

//初始化 “区域地段列表”
var SelectRegionalAreaInit = function (city_id) {

    var area_xx          = document.getElementById("area_id");
    var regional_area_xx = document.getElementById("regional_area_id");
    var AreaDataList = [];
    var RegionalDataList = [];
    var j_area_id;
    var area_id;

    //清除数据下拉选项
    function clearRegionalDataOption(cmb) {

        l_sum = cmb.length;

        for (i = 0; i <= l_sum; i++) {

            cmb.options.remove(cmb[i]);

        }
    }

    //创建城市-区域下拉选项
    function addAreaOption(AREA,obj) {

        // 创建option标签元素
        var option = document.createElement("option");

        // 添加option到选项
        AREA.options.add(option);

        // 元素值
        //option.innerHTML = obj.provinceId;
        option.innerHTML = obj.areaData;

        // 元素value值
        option.value = obj.areaId;

    }

    //创建区域-地段下拉选项
    function addRegionalOption(REGIONAL,obj) {

        // 创建option标签元素
        var option = document.createElement("option");

        // 添加option到选项
        REGIONAL.options.add(option);

        // 元素值
        //option.innerHTML = obj.provinceId;
        option.innerHTML = obj.regionalAreaData;

        // 元素value值
        option.value = obj.regionalAreaId;

    }


    //设置下拉选项默认值
    function setDefaultOption(cmb,option_mc) {

        // 清除之前次对象关系下拉数据
        clearRegionalDataOption(cmb);

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

    //改变区域list数据
    function changeAreaData() {

        if (area_xx.selectedIndex === -1) {

            return;
        }

        if (area_xx.selectedIndex === 0){

            //清除地段下拉数据
            clearRegionalDataOption(regional_area_xx);

            //设置区域、地段默认选项
            setDefaultOption(regional_area_xx,"请选择地段");

        }

        j_area_id = area_xx.options[area_xx.selectedIndex].value;
        area_id = j_area_id;

        //清除之前区域、地段下拉数据
        clearRegionalDataOption(regional_area_xx);

        //设置之前区域、地段默认选项
        setDefaultOption(regional_area_xx,"请选择地段");

        //调用地段
        regionalDataList(area_id);

    }

    //地段数据
    function regionalDataList(area_id){

        $.get('/api/cjgl/getCityRegionalAreaDataList/', {

            "areaId":area_id

        }, function (resp) {

            RegionalDataList = resp.data;
            console.log(RegionalDataList);

            if (resp.status === 10200) {

                for (var i = 0; i < RegionalDataList.length; i++) {

                    //添加地段option
                    addRegionalOption(regional_area_xx, RegionalDataList[i]);

                }

                //changeAreaData();
                //regional_area_xx.onchange = changeCityata;

            }

            else {

                console.log("城市-区域-地段查询结果：", RegionalDataList);

            }

        });

    }

    //调取城市区域数据列表
    function getSelectCityAreaData() {

        $.get('/api/cjgl/getCityAreaDataList/', {

            "cityId":city_id

        }, function (resp) {

            AreaDataList = resp.data;
            console.log(AreaDataList);

            if (resp.status === 10200) {

                for (var i = 0; i < AreaDataList.length; i++) {

                    //添加城市区域option
                    addAreaOption(area_xx, AreaDataList[i]);

                }

                changeAreaData();
                area_xx.onchange = changeAreaData;

            }

            else {

                console.log("城市区域查询结果：", AreaDataList);

            }

        });
    }

    getSelectCityAreaData();

};
