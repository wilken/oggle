var watch = angular.module('watch', [])
watch.factory('websocket', function($rootScope) {
    console.log("initializing websocket")
    var ws = new WebSocket("ws://localhost");
    return {
        onmessage: function(fn) {
            console.log("set onmessage")
            ws.onmessage = function(event) {
                $rootScope.$apply(function() {
                    fn(ws,event);
                });
            }
        },
        send: ws.send,
        onopen:function(fn) {
            console.log("set onopen")
            ws.onopen = function(event) {
                $rootScope.$apply(function() {
                    fn(ws, event);
                });
            }
        },
        onclose: function(fn) {
            ws.onclose = function(event) {
                $rootScope.$apply(function() {
                    fn(ws,event);
                });
            }
        }
    }
})

watch.controller('watchCtrl', function($scope, websocket) {
    console.log("starting controller")
    websocket.onmessage(function(ws,event) {
        console.log(event.data)
        console.log(JSON.parse(event.data)['init'])
    })
    websocket.onclose(function(ws, event) { 
        console.log("socket closed"); 
    })
    websocket.onopen(function(ws,event) {
        ws.send("hello server");
    })

})