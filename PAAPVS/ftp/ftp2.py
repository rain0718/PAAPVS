#!/usr/bin/env python
# Designed for use with boofuzz v0.1.6
from boofuzz import *
import requests
import os
from datetime import datetime
import sys

def main():
    global host
    # host = input("Enter host ip: ")
    host = "192.168.3.5"
    #global password
    #password = input("Enter host password: ")
    port = 21
    pwd = 'HelloWorld307'
    user = '307ftp'


    if len(sys.argv) >= 5:
        host = sys.argv[1]
        port = int(sys.argv[2])
        pwd = sys.argv[3]
        user = sys.argv[4]

    session = Session(
    target=Target(
        connection=SocketConnection(host, port, proto="tcp")
    ),)
    s_initialize("user")
    s_string("USER")
    s_delim(" ")
    s_string(user)
    s_static("\r\n")

    s_initialize("pass")
    s_string("PASS")
    s_delim(" ")
    s_string(pwd)
    s_static("\r\n")

    s_initialize("stor")
    s_string("STOR")
    s_delim(" ")
    s_string("AAAA")
    s_static("\r\n")

    s_initialize("retr")
    s_string("RETR")
    s_delim(" ")
    s_string("AAAA")
    s_static("\r\n")

    session.connect(s_get("user"))
    session.connect(s_get("user"), s_get("pass"))
    session.connect(s_get("pass"), s_get("stor"))
    session.connect(s_get("pass"), s_get("retr"))

    session.fuzz()

if __name__ == "__main__":
    main()
