sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        custfunc: function(oEvent) {
            MessageToast.show("Custom handler invoked.");
        }
    };
});
