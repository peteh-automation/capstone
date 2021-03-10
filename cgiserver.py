#!/usr/bin/python3

"""
As it's name suggests, this script runs a mini CGI server
When running, it listens on port 8081 and responds to a URL like:
http://localhost:8081/cgi-bin/<CGI script> where CGI script might
be get-hostname
"""

import os
from http.server import HTTPServer, CGIHTTPRequestHandler

# Make sure the server is created at current directory
os.chdir(os.path.abspath(os.path.dirname(__file__)))

# Create server object listening the port 8081
PORT = 8081
server_object = HTTPServer(server_address=('', PORT),
                           RequestHandlerClass=CGIHTTPRequestHandler)

# Start the web server
print(f"Starting CGI server on port {PORT} - use ctrl-c to shut it down")
try:
    server_object.serve_forever()
except KeyboardInterrupt:
    print("\nThe server is shut down")
