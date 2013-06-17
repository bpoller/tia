// initialise an uninitialised skeletons map.
var skeletons;

// connect to web sockets server.
var socket = io.connect(document.location.host);

socket.on('connect', function () {

	// update 
	socket.on('skeletonChanged', function(data){
        skeletons = data;
	});
});