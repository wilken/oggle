var watch = angular.module('watch', [])
watch.factory('websocket', function($rootScope) {
    var ws = new WebSocket("ws://localhost");
    return {
        onmessage: function(fn) {
            ws.onmessage = function(event) {
                $rootScope.$apply(function() {
                    fn(ws,event);
                });
            }
        },
        send: ws.send,
        onopen:function(fn) {
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
    $scope.servers ={}
    websocket.onmessage(function(ws,event) {
        var json = JSON.parse(event.data)
        switch(json['type']) {
            case 'init':
                $scope.servers = json['servers']
                break;
            case 'update':
                $scope.servers[json['name']]['status'] = json['server']['status']
                break;
        }
    })
    websocket.onclose(function(ws, event) { 
        console.log("socket closed"); 
    })
    websocket.onopen(function(ws,event) {
        ws.send("hello server");
    })
})