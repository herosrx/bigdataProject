/**
 * Created by zhangbo on 2024/05/18.
 */

//------------------------------------select2 js二级联动菜单------------------------------------//

//初始化 “省份列表”
var SelectProvinceInit = function () {

    var sf_xx            = document.getElementById("sf_id");
    var city_xx          = document.getElementById("city_id");
    var area_xx          = document.getElementById("area_id");
    var regional_area_xx = document.getElementById("regional_area_id");
    var ProvinceDataList = [];
    var sf_id;
    var city_id;
    var j_sf_id;

    //清除数据下拉选项
    function clearCityAreaAegionalDataOption(cmb) {

        l_sum = cmb.length;

        for (i = 0; i <= l_sum; i++) {

            cmb.options.remove(cmb[i]);

        }
    }

    //创建省份下拉选项
    function addProvinceOption(Sf,obj) {

        // 创建option标签元素
        var option = document.createElement("option");

        // 添加option到选项
        Sf.options.add(option);

        // 元素值
        //option.innerHTML = obj.provinceId;
        option.innerHTML = obj.provinceData;

        // 元素value值
        option.value = obj.provinceId;

    }

    //设置下拉选项默认值
    function setDefaultOption(cmb,option_mc) {

        // 清除之前次对象关系下拉数据
        clearCityAreaAegionalDataOption(cmb);

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

    //改变省份list数据
    function changeProvinceData() {

        if (sf_xx.selectedIndex === -1) {

            return;
        }

        if (sf_xx.selectedIndex === 0){

            //清除之前城市、区域、地段下拉数据
            clearCityAreaAegionalDataOption(city_xx);
            clearCityAreaAegionalDataOption(area_xx);
            clearCityAreaAegionalDataOption(regional_area_xx);

            // 设置次对象、三级对象、四级对象关系默认选项
            setDefaultOption(city_xx,"请选择城市");
            setDefaultOption(area_xx,"请选择区域");
            setDefaultOption(regional_area_xx,"请选择地段");

        }

        j_sf_id = sf_xx.options[sf_xx.selectedIndex].value;
        sf_id = j_sf_id;
        //console.log(j_sf_id);
        //console.log("j_sf_id：",typeof (j_sf_id));

        //j_dxys_a_id = parseInt(j_dxys_a_id);
        //console.log(j_dxys_a_id);
        //console.log("j_dxys_a_id：",typeof (j_dxys_a_id));

        if (sf_id === "0") {

            return 0
        }

        else {

            //清除之前城市、区域、地段下拉数据
            clearCityAreaAegionalDataOption(city_xx);
            clearCityAreaAegionalDataOption(area_xx);
            clearCityAreaAegionalDataOption(regional_area_xx);

            // 设置之前城市、区域、地段默认选项
            setDefaultOption(city_xx,"请选择城市");
            setDefaultOption(area_xx,"请选择区域");
            setDefaultOption(regional_area_xx,"请选择地段");

            //调用城市
            SelectCityInit(sf_id);
        }

        //for (var i = 0; i < ProvinceCityDataList.length; i++) {
        //
        //    provinceId_string = ProvinceCityDataList[i].provinceId.toString();
        //
        //    if (provinceId_string === j_sf_id && ProvinceCityDataList[i].provinceData === "北京市" ||
        //        provinceId_string === j_sf_id && ProvinceCityDataList[i].provinceData === "天津市" ||
        //        provinceId_string === j_sf_id && ProvinceCityDataList[i].provinceData === "上海市" ||
        //        provinceId_string === j_sf_id && ProvinceCityDataList[i].provinceData === "广州市" ||
        //        provinceId_string === j_sf_id && ProvinceCityDataList[i].provinceData === "深圳市")
        //    {
        //
        //        sf_id = ProvinceCityDataList[i].provinceId;
        //        //console.log("sf_id: ",sf_id);
        //
        //        //var city_data_list = ProvinceCityDataList[i].dxlx_b_xx;
        //
        //        //console.log("对象要素关系A切换后展示对象要素关系B数据：", dxlx_b_xx_list);
        //
        //        //清除城市、区域、地段下拉数据
        //        clearProvinceCityDataOption(city_xx);
        //        clearProvinceCityDataOption(area_xx);
        //        clearProvinceCityDataOption(regional_area_xx);
        //
        //        // 设置城市、区域、地段默认选项
        //        setDefaultOption(city_xx, "请选择城市");
        //        setDefaultOption(area_xx, "请选择区域");
        //        setDefaultOption(regional_area_xx, "请选择地段");
        //
        //        console.log(ProvinceCityDataList[i]);
        //
        //        addCityOption(city_xx, ProvinceCityDataList[i]);
        //
        //    }
        //
        //    else if (provinceId_string === j_sf_id){
        //
        //        console.log(ProvinceCityDataList[i]);
        //
        //        provinceId_string = ProvinceCityDataList[i].provinceDm;
        //        console.log(provinceId_string);
        //        console.log("provinceId_string:",typeof (provinceId_string));
        //
        //        //citySjdm = ProvinceCityDataList[i].citySjdm;
        //        //provinceId_string = ProvinceCityDataList[i].provinceId.toString();
        //        //console.log("citySjdm:",typeof (citySjdm));
        //
        //        if (ProvinceCityDataList[i].provinceDm === ProvinceCityDataList[i].citySjdm){
        //
        //            for (var j = 0; j < ProvinceCityDataList.length; j++) {
        //
        //                addCityOption(city_xx, ProvinceCityDataList[j]);
        //
        //            }
        //        }
        //
        //    }
        //
        //
        //
        //
        //}

    }

    //调取省份数据列表
    function getSelectProvinceData() {

        $.get('/api/cjgl/getProvinceDataList/', {}, function (resp) {

            ProvinceDataList = resp.data;

            if (resp.status === 10200) {

                //console.log(ProvinceDataList);

                for (var i = 0; i < ProvinceDataList.length; i++) {

                    if (ProvinceDataList[i].provinceSjdm == 0) {

                        //添加省份option
                        addProvinceOption(sf_xx, ProvinceDataList[i]);

                    }
                }

                changeProvinceData();
                sf_xx.onchange = changeProvinceData;

            }

            else {

                console.log("省份查询结果：", ProvinceDataList);

            }

        });
    }

    getSelectProvinceData();

};
