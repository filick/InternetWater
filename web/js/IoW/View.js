/**
 * Created by filick on 2015/12/29.
 */

define(["dojo/_base/declare"], function (declare) {
    return declare(
        null,
        {
            init: function () {},
            renderData: function(data) {},
            refreshData: function(data) {},
            constructor: function () {
                console.log('in view')
            }
        }
    )
});