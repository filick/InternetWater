<%@ page contentType="text/html;charset=utf-8" %>
<%
    String lat = request.getParameter("lat");
    String lon = request.getParameter("lon");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>水联网地理数据云服务平台 Internet of Water</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1,user-scalable=no, width=device-width"/>

    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection"/>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/dataquery.css">
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="js/materialize.js"></script>

    <link href="js/jsoneditor/dist/jsoneditor.min.css" rel="stylesheet" type="text/css">
    <script src="js/jsoneditor/dist/jsoneditor.min.js"></script>
    <script src="js/main.js"></script>
    <script>
        $(function () {
            initNav("soa");

            //界面相关
            $('select').material_select();
            $('.datepicker').pickadate({
                selectMonths: true, // Creates a dropdown to control month
                selectYears: false // Creates a dropdown of 15 years to control year
            });
            $("input:radio[name='group_publishdate']").change(function () {
                var $selectedvalue = $("input[name='group_publishdate']:checked").val();
                if ($selectedvalue === 'history') {
                    $('#radio_publishdate').removeClass('hide');
                } else {
                    $('#radio_publishdate').addClass('hide');
                }
            });
            $("input:radio[name='group_range']").change(function () {
                var $selectedvalue = $("input[name='group_range']:checked").val();
                if ($selectedvalue === 'point') {
                    $('#radio_point').removeClass('hide');
                    $('#radio_rectangle').addClass('hide');
                } else {
                    $('#radio_point').addClass('hide');
                    $('#radio_rectangle').removeClass('hide');
                }
                ;
            });
            var editor = new JSONEditor(document.getElementById("jsoneditor"));
            var json;
            eval(' json = {"Origins":[{"Origin":"ecmwf","DateStrs":[{"DateStr":"20150802","TimeSpans":[{"TimeStr":"00","Datas":[{"Lon":110.375,"Lat":38.375,"Value":0.070907823741436},{"Lon":110.625,"Lat":38.375,"Value":0.070907823741436},{"Lon":110.875,"Lat":38.375,"Value":0.0},{"Lon":111.125,"Lat":38.375,"Value":0.0},{"Lon":111.375,"Lat":38.375,"Value":0.17726954817771912},{"Lon":110.375,"Lat":38.125,"Value":0.0},{"Lon":110.625,"Lat":38.125,"Value":0.01181797031313181},{"Lon":110.875,"Lat":38.125,"Value":0.0},{"Lon":111.125,"Lat":38.125,"Value":0.01181797031313181},{"Lon":111.375,"Lat":38.125,"Value":0.08272579312324524}]},{"TimeStr":"06","Datas":[{"Lon":110.375,"Lat":38.375,"Value":12.432504653930664},{"Lon":110.625,"Lat":38.375,"Value":14.760644912719727},{"Lon":110.875,"Lat":38.375,"Value":19.806917190551758},{"Lon":111.125,"Lat":38.375,"Value":16.533340454101562},{"Lon":111.375,"Lat":38.375,"Value":15.942441940307617},{"Lon":110.375,"Lat":38.125,"Value":12.160691261291504},{"Lon":110.625,"Lat":38.125,"Value":15.670628547668457},{"Lon":110.875,"Lat":38.125,"Value":23.139585494995117},{"Lon":111.125,"Lat":38.125,"Value":19.866008758544922},{"Lon":111.375,"Lat":38.125,"Value":17.419687271118164}]},{"TimeStr":"12","Datas":[{"Lon":110.375,"Lat":38.375,"Value":4.9517292976379395},{"Lon":110.625,"Lat":38.375,"Value":6.3698859214782715},{"Lon":110.875,"Lat":38.375,"Value":7.338959693908691},{"Lon":111.125,"Lat":38.375,"Value":6.251706123352051},{"Lon":111.375,"Lat":38.375,"Value":8.816205978393555},{"Lon":110.375,"Lat":38.125,"Value":10.009820938110352},{"Lon":110.625,"Lat":38.125,"Value":15.824261665344238},{"Lon":110.875,"Lat":38.125,"Value":21.01235008239746},{"Lon":111.125,"Lat":38.125,"Value":19.73600959777832},{"Lon":111.375,"Lat":38.125,"Value":17.384233474731445}]},{"TimeStr":"18","Datas":[{"Lon":110.375,"Lat":38.375,"Value":0.01181797031313181},{"Lon":110.625,"Lat":38.375,"Value":0.05908985063433647},{"Lon":110.875,"Lat":38.375,"Value":0.16545158624649048},{"Lon":111.125,"Lat":38.375,"Value":1.6545158624649048},{"Lon":111.375,"Lat":38.375,"Value":6.712606906890869},{"Lon":110.375,"Lat":38.125,"Value":0.04727188125252724},{"Lon":110.625,"Lat":38.125,"Value":0.6263524293899536},{"Lon":110.875,"Lat":38.125,"Value":1.9026931524276733},{"Lon":111.125,"Lat":38.125,"Value":5.152635097503662},{"Lon":111.375,"Lat":38.125,"Value":11.097073554992676}]}]},{"DateStr":"20150803","TimeSpans":[{"TimeStr":"00","Datas":[{"Lon":110.375,"Lat":38.375,"Value":0.0},{"Lon":110.625,"Lat":38.375,"Value":0.0},{"Lon":110.875,"Lat":38.375,"Value":0.0},{"Lon":111.125,"Lat":38.375,"Value":0.0},{"Lon":111.375,"Lat":38.375,"Value":0.02363594062626362},{"Lon":110.375,"Lat":38.125,"Value":0.02363594062626362},{"Lon":110.625,"Lat":38.125,"Value":0.01181797031313181},{"Lon":110.875,"Lat":38.125,"Value":0.01181797031313181},{"Lon":111.125,"Lat":38.125,"Value":0.04727188125252724},{"Lon":111.375,"Lat":38.125,"Value":0.10636173188686371}]},{"TimeStr":"06","Datas":[{"Lon":110.375,"Lat":38.375,"Value":0.0},{"Lon":110.625,"Lat":38.375,"Value":0.0},{"Lon":110.875,"Lat":38.375,"Value":0.0},{"Lon":111.125,"Lat":38.375,"Value":0.0},{"Lon":111.375,"Lat":38.375,"Value":0.0},{"Lon":110.375,"Lat":38.125,"Value":0.0},{"Lon":110.625,"Lat":38.125,"Value":0.0},{"Lon":110.875,"Lat":38.125,"Value":0.0},{"Lon":111.125,"Lat":38.125,"Value":0.0},{"Lon":111.375,"Lat":38.125,"Value":0.0}]},{"TimeStr":"12","Datas":[{"Lon":110.375,"Lat":38.375,"Value":0.0},{"Lon":110.625,"Lat":38.375,"Value":0.0},{"Lon":110.875,"Lat":38.375,"Value":0.0},{"Lon":111.125,"Lat":38.375,"Value":0.0},{"Lon":111.375,"Lat":38.375,"Value":0.0},{"Lon":110.375,"Lat":38.125,"Value":0.0},{"Lon":110.625,"Lat":38.125,"Value":0.0},{"Lon":110.875,"Lat":38.125,"Value":0.0},{"Lon":111.125,"Lat":38.125,"Value":0.0},{"Lon":111.375,"Lat":38.125,"Value":0.0}]},{"TimeStr":"18","Datas":[{"Lon":110.375,"Lat":38.375,"Value":0.0},{"Lon":110.625,"Lat":38.375,"Value":0.0},{"Lon":110.875,"Lat":38.375,"Value":0.0},{"Lon":111.125,"Lat":38.375,"Value":0.0},{"Lon":111.375,"Lat":38.375,"Value":0.0},{"Lon":110.375,"Lat":38.125,"Value":0.0},{"Lon":110.625,"Lat":38.125,"Value":0.0},{"Lon":110.875,"Lat":38.125,"Value":0.0},{"Lon":111.125,"Lat":38.125,"Value":0.0},{"Lon":111.375,"Lat":38.125,"Value":0.0}]}]}]}]};');
            editor.set(json);

            //调用webservice接口访问最新预报发布的日期
            /*
             $.ajax({
             type: "POST",
             contentType: "text/xml",
             url: "http://101.6.54.28:8081/GlobalForcastRainDataWebService/GlobalForcastRainDataServer",
             data: '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">' +
             '<soap:Body>' +
             '<ObtainLatestForcastDate xmlns:ns1="http://Iservice.cxf.tsinghua.com/>' +
             '</ObtainLatestForcastDate>' +
             '</soap:Body>' +
             '</soap:Envelope>',
             dataType: 'xml',//这里设成XML或者不设。设成JSON格式会让返回值变成NULL
             success: function (xml) {
             alert(xml);
             //对结果做XML解析。
             //浏览器判断 (IE和非IE完全不同)

             if ($.browser.msie) {
             $("#result").append(xml.getElementsByTagName("ns1:out")[0].childNodes[0].nodeValue + "<br/>");
             }
             else {
             $(xml).find("out").each(function () {
             $("#result").append($(this).text() + "<br/>");
             })
             }
             },
             error: function (x, e) {
             alert('error:' + x.responseText);
             },
             complete: function (x) {
             //alert('complete:'+x.responseText);
             }
             });*/
        });
    </script>
</head>
<body>
<nav class="white">
    <div class="nav-wrapper">
        <ul class="left">
            <li><a id="low-logo" class="dropdown-button black-text" href='#' data-activates="page-list"
                   data-hover="true" data-beloworigin="true"><span id="title_active"></span><i
                    class="material-icons left" id="icon_active"></i></a></li>
        </ul>
    </div>
</nav>
<!-- page-list: 鼠标放在logo上后显示的下拉列表 -->
<div id="page-list" class="dropdown-content">
    <li><a id="url_link1"><span id="title_link1"></span><i class="material-icons left" id="icon_link1"></i></a></li>
    <li><a id="url_link2"><span id="title_link2"></span><i class="material-icons left" id="icon_link2"></i></a></li>
</div>

<div class="container">
    <div class="row">
        <form class="col s12" onsubmit="return false">
            <div class="section">
                <h5>数据源</h5>
                <div class="row">
                    <div class="input-field col s12 m8 l4">
                        <select>
                            <option value="tigge" selected>TIGGE数值天气预报</option>
                        </select>
                        <label>选择需要查询的数据源</label>
                    </div>
                </div>
            </div>
            <div class="divider"></div>
            <div class="section">
                <b>选择预报机构</b><br>
                <label>TIGGE集合了全球10个气象预报中心的数值预报结果,选择其中一个</label>

                <p>
                    <input name="group_origin" type="radio" id="ecmwf" checked/>
                    <label for="ecmwf" class="black-text">欧洲(ecmwf)</label>
                    <input name="group_origin" type="radio" id="cma"/>
                    <label for="cma" class="black-text">中国(cma)</label>
                    <input name="group_origin" type="radio" id="ukmo"/>
                    <label for="ukmo" class="black-text">英国(cma)</label>
                </p>
            </div>
            <div class="divider"></div>
            <div class="section">
                <b>选择数据发布日期</b><br>
                <label>说明：选择气象预报数据发布的时间.通常而言,最新发布的数据需滞后2~3天才能下载到.</label>

                <p>
                    <input name="group_publishdate" type="radio" id="latest" value="latest" checked/>
                    <label for="latest" class="black-text">最新预报 (2015年12月30日)</label>
                </p>

                <p>
                    <input name="group_publishdate" type="radio" id="history" value="history"/>
                    <label for="history" class="black-text">历史预报</label>
                </p>
                <div class="row hide" id="radio_publishdate">
                    <div class="col s2 offaset-s1">
                        <p>选择日期：</p>
                    </div>
                    <div class="col s8">
                        <input type="date" class="datepicker" value="6 December, 2015">
                    </div>
                </div>

            </div>
            <div class="divider"></div>
            <div class="section">
                <b>查询范围</b><br>
                <label>说明：选择某块区域进行下载.提供点选和矩形框选两种方式</label>

                <p>
                    <input name="group_range" type="radio" id="point" value="point" checked/>
                    <label for="point" class="black-text">点</label>
                </p>
                <div class="row" id="radio_point">
                    <div class="input-field col s5 offset-s1">
                        <input id="latitude" type="text" class="validate"
                            <%
                            if (lat != null) {
                                out.print(" value='" + lat + "'");
                            }
                            %>
                        >
                        <label for="latitude">经度</label>
                    </div>
                    <div class="input-field col s5">
                        <input id="longitude" type="text" class="validate"
                            <%
                            if (lon != null) {
                                out.print(" value='" + lon + "'");
                            }
                            %>
                        >
                        <label for="longitude">纬度</label>
                    </div>
                </div>
                <p>
                    <input name="group_range" type="radio" id="rectangle" value="rectangle"/>
                    <label for="rectangle" class="black-text">矩形区域</label>
                </p>

                <div class="row hide" id="radio_rectangle">
                    <div class="input-field col s5 offset-s1">
                        <input id="min_latitude" type="text" class="validate">
                        <label for="min_latitude">最小经度</label>
                    </div>

                    <div class="input-field col s5">
                        <input id="max_latitude" type="text" class="validate">
                        <label for="max_latitude">最大经度</label>
                    </div>
                    <div class="input-field col s5 offset-s1">
                        <input id="min_longitude" type="text" class="validate">
                        <label for="min_longitude">最小纬度</label>
                    </div>
                    <div class="input-field col s5">
                        <input id="max_longitude" type="text" class="validate">
                        <label for="max_longitude">最大纬度</label>
                    </div>
                </div>

            </div>
            <div class="divider"></div>
            <div class="section">
                <button class="btn waves-effect waves-light" onclick="$('#result').removeClass('hide')">提交请求
                    <i class="material-icons right">send</i>
                </button>
            </div>
        </form>
    </div>
    <div class="row hide" id="result">
        <div class="col s12">
            <h5>返回结果：</h5>
            <div id="jsoneditor" style="width: 100%; height: 600px;"></div>
        </div>
    </div>
</div>
</body>
</html>