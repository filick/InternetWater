/**
 * Created by filick on 2015/12/30.
 */

var pages = {
    index: {
        url: "index.html",
        title: "水联网地理信息展示",
        icon: "apps"
    },
    monitor: {
        url: "monitor.html",
        title: "水联网数据采集监控",
        icon: "assessment"
    },
    soa: {
        url: "dataquery.jsp",
        title: "水联网数据查询SOA",
        icon: "cloud_queue"
    }
};

function initNav(active_page) {
    var links = [];
    var active = pages[active_page];
    $("#title_active").html(active.title);
    $("#icon_active").html(active.icon);
    for (var p in pages) {
        if (p !== active_page){
            links.push(p);
        }
    }
    var link1 = pages[links[0]];
    var link2 = pages[links[1]];
    $("#title_link1").html(link1.title);
    $("#icon_link1").html(link1.icon);
    $("#url_link1").attr('href', link1.url);
    $("#title_link2").html(link2.title);
    $("#icon_link2").html(link2.icon);
    $("#url_link2").attr('href', link2.url);
}

/*
require([
    'iow/Data'
], function (Data) {

    var tiggeData = new Data("TIGGE气象预报");
    tiggeData.serletUrl = "/TiggeMonitor";
    tiggeData.updateMonitor = function(vbegin, vnum) {
        $.get(tiggeData.serletUrl, {
            action: 'info'
        }).done(function (data) {
            var monitor = eval(data);
            tiggeData.setState(monitor);
        });
        $.get(tiggeData.serletUrl, {
            action: 'list',
            begin: vbegin,
            num: vnum
        }).done(function (data) {
            var vlist = {list: eval(data)};
            tiggeData.setState(vlist);
        });
    };
    $.get(tiggeData.serletUrl, {
        action: 'info'
    }).done(function (data) {
        var monitor = eval(data);
        monitor.list = function(vbegin, vnum) {
            $.get(tiggeData.serletUrl, {
                action: 'list',
                begin: vbegin,
                num: vnum
            });
        };
        tiggeData.setState(monitor);
    });

});
*/