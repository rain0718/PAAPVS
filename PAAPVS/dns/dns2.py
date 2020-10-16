#!/usr/bin/env python
# Designed for use with boofuzz v0.1.6
from boofuzz import *
import os
from datetime import datetime
import configparser
import argparse
import sys

def get_case_info(target, fuzz_data_logger, session, sock, *args, **kwargs):
    fuzz_data_logger.log_info("TransactionID: \n" + str(hex(session.nodes[1].names["TransactionID"]._value)))
    fuzz_data_logger.log_info("domain_part: \n" + str(session.nodes[1].names["domain_part"]._value))
    fuzz_data_logger.log_info("aname: \n" + str(session.nodes[1].names["aname"]._value))
    fuzz_data_logger.log_info("domain_padding: \n" + str(session.nodes[1].names["domain_padding"]._value))
    fuzz_data_logger.log_info("payload: \n" + str(session.nodes[1].names["payload"]._value))


def check_alive(target, fuzz_data_logger, session, sock, *args, **kwargs):


    check_template1 = os.popen("curl -m 3 " + host).readlines()
    check_template2 = os.popen("curl -m 3 " + "baidu.com").readlines()

    if len(check_template2) == 0:
        check_template3 = os.popen("nslookup -timeout=1 " + "baidu.com" + host).readlines()
        if "connection timed out" in ",".join(check_template3):
            fuzz_data_logger.log_info("get baidu.com response info: " + ",".join(check_template2))
            fuzz_data_logger.log_fail("Target dns service may crash!!!!!")
            print("Target dns service may crash!!!!!")
            # print(check_template2, check_template3)
            input("\nRestart target manually!!!!!!")
        else:
            fuzz_data_logger.log_pass("Target alive!")
    elif len(check_template1) == 0:
        fuzz_data_logger.log_info("get " + host + " response info: " + ",".join(check_template2))
        fuzz_data_logger.log_fail("Target may crash!!!!!")
        print("Target may crash!!!!!")
        input("\nRestart target manually!!!!!!")
    else:
        fuzz_data_logger.log_pass("Target alive!")


def main():
    global host
    config = configparser.ConfigParser()
    config.read("./dns.ini", encoding='utf-8')
    host = config.get('base', 'host')
    password = config.get('base', 'password')
    port = config.getint('base', 'port')

    if len(sys.argv) >= 3:
        host = sys.argv[1]
        port = int(sys.argv[2])


    file_log = open(datetime.now().strftime("%Y-%m-%d-%H-%M-%S") + '.txt', 'w')
    my_logger = [FuzzLoggerText(file_handle=file_log)]

    session = Session(
        target=Target(
            connection=SocketConnection(host, port, proto="udp", bind=("", 11111))
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

    s_initialize(name="Query")
    s_word(0xcb63, name="TransactionID", endian=">", fuzzable=True)
    # Flags

    # s_bit_field(0, width=1, endian=">", name="QR", fuzzable=False)
    # s_bit_field(0, width=4, endian=">", name="opcode", fuzzable=False)
    # s_bit_field(0, width=1, endian=">", name="AA", fuzzable=False)
    # s_bit_field(0, width=1, endian=">", name="TC", fuzzable=False)
    # s_bit_field(1, width=1, endian=">", name="RD", fuzzable=False)
    # s_bit_field(0, width=1, endian=">", name="RA", fuzzable=False)
    # s_bit_field(0, width=3, endian=">", name="Z", fuzzable=False)
    # s_bit_field(0, width=4, endian=">", name="rcode", fuzzable=False)

    s_word(256, name="Flags", endian=">", fuzzable=False)
    s_word(1, name="Questions", endian=">", fuzzable=False)
    s_word(0, name="Answer", endian=">", fuzzable=False)
    s_word(0, name="Authority", endian=">", fuzzable=False)
    s_word(0, name="Additional", endian=">", fuzzable=False)

    ############## Query ################
    if s_block_start("Query"):
        if s_block_start("name_chunk"):
            s_size("label", length=1, fuzzable=False)
            if s_block_start("label"):
                s_string("tplogin", name="domain_part", fuzzable=True)
            s_block_end()
        s_block_end()
        s_repeat("name_chunk", min_reps=1, max_reps=4, step=1, fuzzable=True, name="aname")
        if s_block_start("name_chunk_padding"):
            s_size("label_padding", length=1, fuzzable=False)
            if s_block_start("label_padding"):
                s_string("cn", name="domain_padding", fuzzable=True)
            s_block_end()
        s_block_end()
        s_byte(0, endian=">", name="end", fuzzable=False)
        s_word(1, name="Type", endian=">", fuzzable=False)
        s_word(1, name="Class", endian=">", fuzzable=False)
        s_string("A", name="payload", fuzzable=True, max_len=2048)
    s_block_end()

    session.connect(s_get("Query"), )

    session.fuzz()


if __name__ == "__main__":
    main()
