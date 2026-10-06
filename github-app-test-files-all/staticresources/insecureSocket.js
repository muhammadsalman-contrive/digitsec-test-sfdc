var socket = new WebSocket('ws://insecure-example.com/feed');
socket.onmessage = function (e) { document.getElementById('out').innerHTML = e.data; };
