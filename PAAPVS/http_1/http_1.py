#!/usr/bin/env python
# Designed for use with boofuzz v0.1.6
from boofuzz import *
import requests
import os
from datetime import datetime
import sys
import subprocess

def get_case_info(target, fuzz_data_logger, session, sock, *args, **kwargs):
    fuzz_data_logger.log_info("Method: \n" + str(session.nodes[1].names["Method"]._value))
    fuzz_data_logger.log_info("space-1: \n" + str(session.nodes[1].names["space-1"]._value))
    fuzz_data_logger.log_info("Request-URI: \n" + str(session.nodes[1].names["Request-URI"]._value))
    fuzz_data_logger.log_info("Host-Line: \n" + str(session.nodes[1].names["Host-Line"]._value))
    fuzz_data_logger.log_info("Host-Line-Value: \n" + str(session.nodes[1].names["Host-Line-Value"]._value))
    fuzz_data_logger.log_info("space-4: \n" + str(session.nodes[1].names["space-4"]._value))
    #fuzz_data_logger.log_info("Content-Length-Value: \n" + str(session.nodes[1].names["Content-Length-Value"]._value))
    fuzz_data_logger.log_info("Body-Content-Value: \n" + str(session.nodes[1].names["Body-Content-Value"]._value))

def check_alive(target, fuzz_data_logger, session, sock, *args, **kwargs):


    status,check_template1 = subprocess.getstatusoutput("ping -c 4 " + host)
    print(check_template1)
    #check_template2 = os.popen("curl -m 3 " + "baidu.com").readlines()

    if "100% packet loss" in ",".join(check_template1):
        fuzz_data_logger.log_fail("设备可能崩溃了!!!!!")
        input("\n请手动重启设备!!!!!!")
    else:
            fuzz_data_logger.log_pass("设备存活!")

def main():
    global host
    #host = input("Enter host ip: ")
    #host = "192.168.1.1"
    #global password
    #password = input("Enter host password: ")
    #port = int(input("Enter port: "))
    host = "192.168.1.202"
    port = 80
    if len(sys.argv) >= 3:
        host = sys.argv[1]
        port = int(sys.argv[2])

    file_log = open(datetime.now().strftime("%Y-%m-%d-%H-%M-%S") + '.txt', 'w')
    my_logger = [FuzzLoggerText(file_handle=file_log)]
    
    session = Session(
        target=Target(
            connection=SocketConnection(host, port, proto="tcp")
            # netmon=Remote_NetworkMonitor(host, port, proto='tcp')
        ),
        receive_data_after_fuzz=True,
        check_data_received_each_request=True,
        ignore_connection_issues_when_sending_fuzz_data=False,
        reuse_target_connection=False,
        fuzz_loggers=my_logger,
        fuzz_db_keep_only_n_pass_cases=0,
        restart_sleep_time=60,
        post_test_case_callbacks=[get_case_info],
        pre_send_callbacks=[check_alive],
        # crash_threshold_element=1,
        # crash_threshold_request=1,
        sleep_time=1,
        ignore_connection_reset=True,
        # restart_interval=100,
    
    )
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
