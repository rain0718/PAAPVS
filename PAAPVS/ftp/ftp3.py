#!/usr/bin/env python
# Designed for use with boofuzz v0.1.6
from boofuzz import *
import requests
import os
from datetime import datetime
import sys
import subprocess

def get_case_info(target, fuzz_data_logger, session, sock, *args, **kwargs):
    fuzz_data_logger.log_info("USER: \n" + str(session.nodes[1].names["USER"]._value))
    fuzz_data_logger.log_info("USER-space: \n" + str(session.nodes[1].names["USER-space"]._value))
    fuzz_data_logger.log_info("user: \n" + str(session.nodes[1].names["user"]._value))
    fuzz_data_logger.log_info("PASS: \n" + str(session.nodes[1].names["PASS"]._value))
    fuzz_data_logger.log_info("PASS-space: \n" + str(session.nodes[1].names["PASS-space"]._value))
    fuzz_data_logger.log_info("pass: \n" + str(session.nodes[1].names["pass"]._value))
    fuzz_data_logger.log_info("STOR: \n" + str(session.nodes[1].names["STOR"]._value))
    fuzz_data_logger.log_info("STOR-space: \n" + str(session.nodes[1].names["STOR-space"]._value))
    fuzz_data_logger.log_info("STOR-file: \n" + str(session.nodes[1].names["STOR-file"]._value))
    fuzz_data_logger.log_info("RETR: \n" + str(session.nodes[1].names["RETR"]._value))
    fuzz_data_logger.log_info("RETR-space: \n" + str(session.nodes[1].names["RETR-space"]._value))
    fuzz_data_logger.log_info("RETR-file: \n" + str(session.nodes[1].names["RETR-file"]._value))

def check_alive(target, fuzz_data_logger, session, sock, *args, **kwargs):


    status,check_template1 = subprocess.getstatusoutput("ping -c 4 " + host)
    print(check_template1)

    if "100% packet loss" in ",".join(check_template1):	
        fuzz_data_logger.log_fail("设备可能崩溃了!!!!!")
        input("\n请手动重启设备!!!!!!")
    else:
            fuzz_data_logger.log_pass("设备存活!")

def main():
    global host
    # host = input("Enter host ip: ")
    host = "192.168.3.5"
    #global password
    #password = input("Enter host password: ")
    port = 21
    pwd = "HelloWorld307"
    user = "307ftp"


    if len(sys.argv) >= 5:
        host = sys.argv[1]
        port = int(sys.argv[2])
        pwd = sys.argv[3]
        user = sys.argv[4]
    
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
        ignore_connection_reset=False,
        # restart_interval=100,
    
    )
    s_initialize("user")
    s_string("USER",name="USER")
    s_delim(" ",name="USER-space")
    s_string(user,name="user")
    s_static("\r\n")

    s_initialize("pass")
    s_string("PASS",name="PASS")
    s_delim(" ",name="PASS-space")
    s_string(pwd,name="pwd")
    s_static("\r\n")

    s_initialize("stor")
    s_string("STOR",name="STOR")
    s_delim(" ",name="STOR-space")
    s_string("AAAA",name="STOR-file")
    s_static("\r\n")

    s_initialize("retr")
    s_string("RETR",name="RETR")
    s_delim(" ",name="RETR-space")
    s_string("AAAA",name="RETR-file")
    s_static("\r\n")

    session.connect(s_get("user"))
    session.connect(s_get("user"), s_get("pass"))
    session.connect(s_get("pass"), s_get("stor"))
    session.connect(s_get("pass"), s_get("retr"))

    session.fuzz()

if __name__ == "__main__":
    main()
