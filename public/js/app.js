var watch = angular.module('watch', [])
watch.factory('websocket', function($rootScope) {
    console.log("initializing websocket")
    var ws = new WebSocket("ws://localhost");
    return {
        onmessage: function(fn) {
            console.log("set onmessage")
            ws.onmessage = function(evt) {
                $rootScope.$apply(function() {
                    fn(evt);
                });
            }
        },
        send: ws.send,
        onopen:function(fn) {
            console.log("set onopen")
            ws.onopen = function() {
                $rootScope.$apply(function() {
                    fn(ws);
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
    console.log("starting controller")
    websocket.onmessage(function(evt) {
        console.log(evt)
    })
    websocket.onclose(function() { 
        console.log("socket closed"); 
    })
    websocket.onopen(function(ws) { 
        console.log("connected...");
        this.websocket.send("hello server");
    })

})