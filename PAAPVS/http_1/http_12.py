#!/usr/bin/env python
# Designed for use with boofuzz v0.1.6
from boofuzz import *
import requests
import os
from datetime import datetime
import sys
def main():
    global host
    #host = input("Enter host ip: ")
    #host = "192.168.1.1"
    #global password
    #password = input("Enter host password: ")
    #port = int(input("Enter port: "))
    host = "192.168.3.1"
    port = 80
    if len(sys.argv) >= 3:
        host = sys.argv[1]
        port = int(sys.argv[2])


    session = Session(
    target=Target(
        connection=SocketConnection(host, port, proto="tcp")
    ),)
    s_initialize(name="Request")
    with s_block("Request-Line"):
        s_group("Method", ["GET", "HEAD", "POST", "PUT", "DELETE", "CONNECT", "OPTIONS", "TRACE"])
        s_delim(" ", name="space-1")
        s_string("/index.html", name="Request-URI")
        s_delim(" ", name="space-2")
        s_string("HTTP/1.1", name="HTTP-Version")
        s_static("\r\n", name="Request-Line-CRLF")
        s_string("Host:", name="Host-Line")
        s_delim(" ", name="space-3")
        s_string("example.com", name="Host-Line-Value")
        s_static("\r\n", name="Host-Line-CRLF")
        s_static("Content-Length:", name="Content-Length-Header")
        s_delim(" ", name="space-4")
        s_size("Body-Content", output_format="ascii", name="Content-Length-Value")
        s_static("\r\n", "Content-Length-CRLF")
    s_static("\r\n", "Request-CRLF")

    with s_block("Body-Content"):
        s_string("Body content ...", name="Body-Content-Value")

    session.connect(s_get("Request"))

    session.fuzz()


if __name__ == "__main__":
    main()
