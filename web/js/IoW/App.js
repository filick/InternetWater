/**
 * Created by filick on 2015/12/28.
 */

define(["dojo/_base/declare"], function (declare) {
    return declare(
        null,
        {
            view: null,
            datas: [],
            constructor: function(view) {
                this.view = view;
                this.view.init();
            },
            addData: function(data) {
                this.datas.push(data);
                this.view.renderData(data);
            }
        }
    )
});