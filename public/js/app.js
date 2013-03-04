var watch = angular.module('watch', [])
watch.factory('websocket', function($rootScope) {
    console.log("initializing websocket")
    var ws = new WebSocket("ws://localhost");
    return {
        onmessage: function(fn) {
            ws.onmessage = function(evt) {
                $rootScope.$apply(function() {
                    fn(evt);
                });
            }
        },
        send: ws.send,
        onopen:function(fn) {
            ws.onopen = function() {
                $rootScope.$apply(function() {
                    fn();
                });
            }
        },
        onclose: function(fn) {
            ws.onclose = function() {
                $rootScope.$apply(function() {
                    fn();
                });
            }
        }
    }
})

watch.controller('watchCtrl', function($scope, websocket) {
    websocket.onmessage = function(evt) {
        console.log(evt)
    };
    websocket.onclose = function() { 
        console.log("socket closed"); 
    };
    websocket.onopen = function() { 
        console.log("connected...");
        websocket.send("hello server");
    };

})