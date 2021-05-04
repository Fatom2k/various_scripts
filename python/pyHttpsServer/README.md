# py3SimpleHttpsServer
A simple httpS server that serves current directory
Server @ 127.1:4443

## launch
python3 py3SimpleHttpsServer.py

## Generate self signed server.pem with
openssl req -new -x509 -keyout server.pem -out server.pem -days 365 -nodes


# Simple http (without ssl) server port to be specified. need su priviledge if port < 1024
python3 -m http.server [port] 
