var watch = angular.module('watch', [])
watch.factory('websocket', function($rootScope) {
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
        onopen: ws.onopen,
        onclose: ws.onclose
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