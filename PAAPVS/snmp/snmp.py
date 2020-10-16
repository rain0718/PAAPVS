#!/usr/bin/env python
# Designed for use with boofuzz v0.1.6
from boofuzz import *
import os
from datetime import datetime
import configparser
import argparse
import sys
import subprocess
def get_case_info(target, fuzz_data_logger, session, sock, *args, **kwargs):
    fuzz_data_logger.log_info("Request-ID-Value: \n" + str(session.nodes[1].names["Request-ID-Value"]._value))
    fuzz_data_logger.log_info("Oid-Value: \n" + str(session.nodes[1].names["Oid-Value"]._value))
    #fuzz_data_logger.log_info("domain_padding: \n" + str(session.nodes[1].names["domain_padding"]._value))
    #fuzz_data_logger.log_info("payload: \n" + str(session.nodes[1].names["payload"]._value))


def check_alive(target, fuzz_data_logger, session, sock, *args, **kwargs):

    status,check_template1 = subprocess.getstatusoutput("ping -c 4 " + host)
    print(check_template1)
    # check_template1 = os.popen("ping -c 4 " + host).readlines()
    # print(check_template1)
    #check_template2 = os.popen("curl -m 3 " + "baidu.com").readlines()

    if "100% packet loss" in check_template1:
        fuzz_data_logger.log_fail("设备可能崩溃了!!!!!")
        input("\n请手动重启设备!!!!!!")
    else:
        fuzz_data_logger.log_pass("设备存活!")


def main():
    global host
    host = '192.168.1.1'
    version = '2'
    # port = int(input("Enter port: "))
    port = 161
    community = 'kali'
    #oid = '1.3.6'
    #oid = '1.3.6.1'
    #reqid = random.randint(0,pow(2,15))+pow(2,31)
    #reqid = 663253987
    """SNMP data use BER(Basic Encoding Rule) Encoding, include: Identifier(tag) + Length + Value. AKA TLV formant or ILC format. """
       
    if len(sys.argv) >= 4:
        host = sys.argv[1]
        port = int(sys.argv[2])
        community = sys.argv[3]
    file_log = open(datetime.now().strftime("%Y-%m-%d-%H-%M-%S") + '.txt', 'w')
    my_logger = [FuzzLoggerText(file_handle=file_log)]
    

    session = Session(
        target=Target(
            connection=SocketConnection(host, port, proto="udp", bind=("", 2222))
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

    s_initialize(name="get-next-request")
    
    ############## SNMP Message ################
    if s_block_start("SNMP-Message"):
        s_static("\x30")
        s_size("Message-Value", length=1, fuzzable=False)
        if s_block_start("Message-Value"):
            if s_block_start("SNMP-Version"):
                s_static("\x02\x01\x01")
            s_block_end()
            if s_block_start("SNMP-Community-String"):
                s_static("\x04")
                s_size("SNMP-Community-String-Value", length=1, fuzzable=False)
                if s_block_start("SNMP-Community-String-Value"):
                    s_static(community)
                s_block_end()
            s_block_end()
            if s_block_start("SNMP-PDU"):
                s_static("\xa1")
                s_size("SNMP-PDU-Value", length=1, fuzzable=False)
                if s_block_start("SNMP-PDU-Value"):
                    if s_block_start("Request-ID"):
                        s_static("\x02\x04")
                        s_random("\x27\x28\x73\xe3", min_length=4, max_length=4, num_mutations=1000, name="Request-ID-Value")
                    s_block_end()
                    if s_block_start("Error"):
                        s_static("\x02\x01\x00")
                    s_block_end()
                    if s_block_start("Error-Index"):
                        s_static("\x02\x01\x00")
                    s_block_end()
                    if s_block_start("Varbind-List"):
                        s_static("\x30")
                        s_size("Varbind-List-Value", length=1, fuzzable=False)
                        if s_block_start("Varbind-List-Value"):
                            if s_block_start("Varbind"):
                                s_static("\x30")
                                s_size("Varbind-Value", length=1, fuzzable=False)
                                if s_block_start("Varbind-Value"):
                                    #Object Identifier
                                    s_static("\x06")
                                    s_size("Object-Identifier-Value", length=1, fuzzable=False)
                                    if s_block_start("Object-Identifier-Value"):
                                        s_random("\x2b\x06\x01", min_length=3, max_length=5, num_mutations=3000, name="Oid-Value")
                                    s_block_end()
                                    if s_block_start("Type-Null"):
                                        s_static("\x05\x00")
                                    s_block_end()
                                s_block_end()
                            s_block_end()
                        s_block_end()
                    s_block_end()
                s_block_end()
            s_block_end()
        s_block_end()
    s_block_end()
                                        
    session.connect(s_get("get-next-request"), )

    session.fuzz()


if __name__ == "__main__":
    main()
