/**
 * Created by filick on 2015/12/30.
 */

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