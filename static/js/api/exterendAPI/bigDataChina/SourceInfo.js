/**
 * Created by zhangbo on 2024/05/21.
 */

//------------------------------------select2 js二级联动菜单------------------------------------//

//初始化 “来源信息”
var SelectSourceInit = function () {

    var lyxx_id            = document.getElementById("lyxx_id");
    var lywz_id            = document.getElementById("lywz_id");

    var SourceDataList = [];
    var SourceCityDataList = [];


    //清除数据下拉选项
    function clearSourceDataOption(cmb) {

        l_sum = cmb.length;

        for (i = 0; i <= l_sum; i++) {

            cmb.options.remove(cmb[i]);

        }
    }

    //创建来源下拉选项
    function addSourceOption(LYXX,obj) {

        // 创建option标签元素
        var option = document.createElement("option");

        // 添加option到选项
        LYXX.options.add(option);

        // 元素值
        option.innerHTML = obj.sourceData;

        // 元素value值
        option.value = obj.sourceId;

    }

    //创建来源城市下拉选项
    function addSourceCityOption(LYWZ, obj) {

        // 创建option标签元素
        var option = document.createElement("option");

        // 添加option到选项
        LYWZ.options.add(option);

        // 元素值
        option.innerHTML = obj.sourceLink;

        // 元素value值
        option.value = obj.sourceId;

    }


    //设置下拉选项默认值
    function setDefaultOption(cmb,option_mc) {

        // 清除之前下拉数据
        clearSourceDataOption(cmb);

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

    //来源城市list
    function sourceCityData(lyxx_id){

        if (lyxx_id === 0) {

            return 0;
        }

        $.get('/api/cjgl/getSourceCityDataList/', {

            "lyxxId":lyxx_id

        }, function (resp) {

            SourceCityDataList = resp.data;

            if (resp.status === 10200) {

                //console.log(SourceCityDataList);

                for (var i = 0; i < SourceCityDataList.length; i++) {

                    //console.log(SourceCityDataList[i]);
                    //添加来源信息option
                    addSourceCityOption(lywz_id, SourceCityDataList[i]);

                }

                //changeSourceData();
                //lyxx_id.onchange = changeSourceData;

            }

            else {

                console.log("来源信息查询结果：", SourceDataList);

            }

        });

    }

    //改变来源信息list数据
    function changeSourceData() {

        if (lyxx_id.selectedIndex === -1) {

            return;
        }

        if (lyxx_id.selectedIndex === 0){

            //清除之前来源网站下拉数据
            clearSourceDataOption(lywz_id);

            //设置来源网址默认选项
            setDefaultOption(lywz_id,"请选择来源网址");

        }

        else {
            //清除之前来源网站下拉数据
            clearSourceDataOption(lywz_id);

            //设置来源网址默认选项
            setDefaultOption(lywz_id, "请选择来源网址");

            var j_lyxx_id = lyxx_id.options[lyxx_id.selectedIndex].value;

            sourceCityData(j_lyxx_id);
        }
    }

    //调取来源信息数据列表
    function getSelectSourceData() {

        $.get('/api/cjgl/getSourceDataList/', {}, function (resp) {

            SourceDataList = resp.data;

            if (resp.status === 10200) {

                //console.log(SourceDataList);

                for (var i = 0; i < SourceDataList.length; i++) {

                    //添加来源信息option
                    addSourceOption(lyxx_id, SourceDataList[i]);

                }

                changeSourceData();
                lyxx_id.onchange = changeSourceData;

            }

            else {

                console.log("来源信息查询结果：", SourceDataList);

            }

        });
    }

    getSelectSourceData();

};
