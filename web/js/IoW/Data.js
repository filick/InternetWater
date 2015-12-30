/**
 * Created by filick on 2015/12/26.
 */

define(["dojo/_base/declare"], function (declare) {
    return declare(
        null,
        {
            name: null,
            state: {
                // display
                display: true,
                transparency: 1,

                // monitor
                count: 0,
                totalSize: 0,
                header: [],
                list: function(begin, num){}
            },

            updateState: function () {},

            constructor: function (name, initState) {
                this.name = name;
                if (initState.hasOwnProperty()) {
                    for (var prop in initState) {
                        this.state[prop] = initState[prop];
                    }
                }
            },

            setState: function (state) {
                for (var prop in state) {
                    this.state[prop] = state[prop];
                }
            }
        }
    )
});