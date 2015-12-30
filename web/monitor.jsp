<%--
  Created by IntelliJ IDEA.
  User: filick
  Date: 2015/12/30
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1,user-scalable=no, width=device-width"/>
    <title>水联网 Internet of Water</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection"/>
    -->
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
    <link rel="stylesheet" href="https://js.arcgis.com/3.15/dijit/themes/claro/claro.css">
    <link rel="stylesheet" href="https://js.arcgis.com/3.15/esri/css/esri.css">

    <!--  CDN 3.12
    <link rel="stylesheet" href="http://jsapi.thinkgis.cn/esri/css/esri.css">
    -->
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="js/materialize.js"></script>
    <script>
        var dojoConfig = {
            parseOnLoad: true,
            packages: [{
                name: 'iow',
                location: '/js/IoW'
            }]
        };
    </script>
    <script src="https://js.arcgis.com/3.15/"></script>
    <script src="js/main.js"></script>


    <script>
        require([
            'iow/View',
            'iow/App',
            'dojo/domReady!'
        ], function (
                View,
                App
        ) {

            var page = new View();

            var app = new App(page);
        });
    </script>
</head>
<body>
<nav class="white">
    <div class="nav-wrapper">
        <ul class="left">
            <li><a id="low-logo" class="dropdown-button black-text" href='#' data-activates="page-list"
                   data-hover="true" data-beloworigin="true">水联网数据采集监控平台<i
                    class="material-icons left">assessment</i></a></li>
        </ul>
    </div>
</nav>
<!-- page-list: 鼠标放在logo上后显示的下拉列表 -->
<div id="page-list" class="dropdown-content">
    <li><a href="index2.html">水联网地理数据展示平台<i class="material-icons left">assessment</i></a></li>
    <li><a href="dataquery.html">水联网数据查询SOA服务<i class="material-icons left">cloud_queue</i></a></li>
</div>


</body>
</html>
