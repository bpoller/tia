var http = require("http"),
    url = require("url"),
    path = require("path"),
    fs = require("fs")
    io = require('socket.io');

    port = process.argv[2] || 8888;

function httpRequestHandler(request, response) {
 
  var uri = url.parse(request.url).pathname
    , filename = path.join(process.cwd(), uri);
  
  fs.exists(filename, function(exists) {
    if(!exists) {
      response.writeHead(404, {"Content-Type": "text/plain"});
      response.write("404 Not Found\n");
      response.end();
      return;
    }
 
    if (fs.statSync(filename).isDirectory()) filename += '/index.html';
 
    fs.readFile(filename, "binary", function(err, file) {
      if(err) {        
        response.writeHead(500, {"Content-Type": "text/plain"});
        response.write(err + "\n");
        response.end();
        return;
      }
 
      response.writeHead(200);
      response.write(file, "binary");
      response.end();
    });
  });
};
 
var server = http.createServer(httpRequestHandler);
server.listen(parseInt(port, 10));
var ioServer = io.listen(server);

console.log("Static file server running at\n  => http://localhost:" + port);
console.log("Press CTRL + C to shutdown");

ioServer.sockets.on('connection', function (socket) {
    socket.on('bcSkeletonChanged',function (data){
         socket.broadcast.emit('skeletonChanged', data);
     });
});

ioServer.set('log level', 1);