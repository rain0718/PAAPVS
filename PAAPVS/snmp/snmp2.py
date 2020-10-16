#!/usr/bin/env python
# Designed for use with boofuzz v0.1.6
from boofuzz import *
import struct
import random
import math
import sys
def oid_str2rawbytes(oid):
    """Encode oid to bytes array to use sending packet"""
    oid_splitted = oid.split('.')
    res = ''

    # root items (1.3 usualy converted to 1 byte chr(43))!
    if len(oid_splitted)>1:
        res+=chr(40*int(oid_splitted[0])+int(oid_splitted[1]))
    # rest items
    for i in oid_splitted[2:]:
        v = int(i)
        if v < 128:
            res += chr(v)
        else:
            res += chr(128 + int(v/128))
            res += chr(v % 128)

    return res
    
def length_str2rawbytes(length):
    v = len(length)
    if v < 128:
        res = chr(v)
        return res
    else:
        res = chr((128 + math.ceil((len(hex(v)) - 2)/2)))
        w = hex(v)[2:]
        if len(w)%2 == 1:
            w = '0' + w
        ascii = ''
        for i in range(0, len(w), 2):
            str = '0x' + w[i:i+2]
            ascii = ascii + chr(int(str,16))
        res = res + ascii
        return res

def reqid_int2rawbytes(reqid):
    w = hex(reqid)[2:]
    if len(w)%2 == 1:
        w = '0' + w
    ascii = ''
    for i in range(0, len(w), 2):
        str = '0x' + w[i:i+2]
        ascii += chr(int(str,16))
    return ascii

def value_rawbytes2int(value):
    v = len(value)
    w = '0x'
    if v < 2:
        return ord(value)
    else:
        for i in value:
            w += hex(ord(i))[2:]
        return  int(w,16)

'''
def length_countrawbytes(length):
    v = len(length)
    if v > 1:
        return v-1
    else:
        return 1
'''

#def reqid_rawbytes2eachbyteint(reqid_data):

def main():
    # host = input('Enter ip: ')
    host = '192.168.1.1'
    version = '2'
    #port = 161
    # port = int(input("Enter port: "))
    port = 161
    community = 'kali'
    #oid = '1.3.6'
    oid = '1.3.6.1.2.1.4.20'
    #reqid = random.randint(0,pow(2,15))+pow(2,31)
    reqid = 1970624860
    """SNMP data use BER(Basic Encoding Rule) Encoding, include: Identifier(tag) + Length + Value. AKA TLV formant or ILC format. """
       
    if len(sys.argv) >= 4:
        host = sys.argv[1]
        port = int(sys.argv[2])
        community = sys.argv[3]
    #Variable-Bindings
    ##Type Null
    valuenull_data = chr(5) + chr(0) #footer
    ##Oid 
    oid_data = oid_str2rawbytes(oid)
    
    ##Object Length
    objlen_data = length_str2rawbytes(oid_data)
    
    ##Object Identifier
    objiden_data = chr(6)
    
    ##Variable-Name1 | Variable-Value1 Length
    varnamelen_data = length_str2rawbytes(objiden_data + objlen_data + oid_data + valuenull_data)
    
    ##Variable-Name1 | Variable-Value1 Identifier
    varnameiden_data = '\x30' 

    
    #Get/Set Header
    ##Variable-Bindings Length
    varbinlen_data = length_str2rawbytes(varnameiden_data + varnamelen_data + objiden_data + objlen_data + oid_data + valuenull_data)
    ##Variable-Bindings Identifier
    varbiniden_data = '\x30'
    
    ##Error Index
    errindex_data = chr(0) #0 max-repetitions ??
    
    ##Error Index length
    errindexlen_data = length_str2rawbytes(errindex_data)
    
    ##Error Index Identifier
    errindexiden_data = chr(2)
    
    ##Error Status
    errstatus_data = chr(0) #noError(0)
    
    ##Error Status Length
    errstatuslen_data = length_str2rawbytes(errstatus_data)
    ##Error Status Identifier
    errstatusiden_data = chr(2)
    
    ##Request-Id 
    reqid_data = reqid_int2rawbytes(reqid)
    
    ##Request-Id Length
    reqidlen_data = length_str2rawbytes(reqid_data)
    
    ##Request-Id Identifier
    reqididen_data = chr(2)
    
    
    #SNMP Header
    ##PDU Length
    pdulen_data = length_str2rawbytes(reqididen_data + reqidlen_data + reqid_data + errstatusiden_data + errstatuslen_data + errstatus_data + errindexiden_data + errindexlen_data + errindex_data + varbiniden_data + varbinlen_data + varnameiden_data + varnamelen_data + objiden_data + objlen_data + oid_data + valuenull_data)
    
    ##PDU Identifier
    pduiden_data = '\xa1' #get-next-request(1)
    
    ##SNMP Community
    community_data = community
    
    ##SNMP Community Length
    communitylen_data = length_str2rawbytes(community_data)
    
    ##SNMP Community Identifier
    communityiden_data = chr(4)
    
    ##SNMP Version Number
    version_data = chr(int(version)-1)
    
    ##SNMP Version Length
    versionlen_data = length_str2rawbytes(version_data)
    
    ##SNMP Version Identifier
    versioniden_data = chr(2)
    
    ##SNMP Message Length
    snmplen_data = length_str2rawbytes(versioniden_data + versionlen_data + version_data + communityiden_data + communitylen_data + community_data + pduiden_data + pdulen_data + reqididen_data + reqidlen_data + reqid_data + errstatusiden_data + errstatuslen_data + errstatus_data + errindexiden_data + errindexlen_data + errindex_data + varbiniden_data + varbinlen_data + varnameiden_data + varnamelen_data + objiden_data + objlen_data + oid_data + valuenull_data)
    
    ##SNMP Encoding Identifier
    snmpiden_data = '\x30'

    
    #Whole Data
    data = snmpiden_data + snmplen_data + versioniden_data + versionlen_data + version_data + communityiden_data + communitylen_data + community_data + pduiden_data + pdulen_data + reqididen_data + reqidlen_data + reqid_data + errstatusiden_data + errstatuslen_data + errstatus_data + errindexiden_data + errindexlen_data + errindex_data + varbiniden_data + varbinlen_data + varnameiden_data + varnamelen_data + objiden_data + objlen_data + oid_data + valuenull_data
    #send_data = bytes(map(ord,data))
    
    session = Session(
        target=Target(
            connection=SocketConnection(host, port, proto='udp')
        ),
    )

    s_initialize(name = 'Request')
    with s_block('SNMP Header'):
        s_static(snmpiden_data, name = 'SNMP Encoding Identifier')
        s_static(snmplen_data, name = 'SNMP Message Length')
        s_static(versioniden_data, name = 'SNMP Version Identifier')
        s_static(versionlen_data, name = 'SNMP Version Length')
        s_static(version_data, name = 'SNMP Version Number')
        s_static(communityiden_data, name = 'SNMP Community Identifier')
        s_static(communitylen_data, name = 'SNMP Community Length')
        s_string(community_data, fuzzable = False, name = 'SNMP Community')
        s_static(pduiden_data, name = 'PDU Identifier')
        s_static(pdulen_data, name = 'PDU Length')
        
    with s_block(name = 'Get/Set Header'):
        s_static(reqididen_data, name = 'Request-Id Identifier')
        s_static(reqidlen_data, name = 'Request-Id Length')
        #s_string(reqid_data, name = 'Request-Id ')
        s_bit_field(reqid, width = len(reqid_data)*8, endian = '>', full_range = False, name = 'Request-Id ')
        s_static(errstatusiden_data, name = 'Error Status Identifier')
        s_static(errstatuslen_data, name = 'Error Status Length')
        s_static(errstatus_data, name = 'Error Status')
        s_static(errindexiden_data, name = 'Error Index Identifier')
        s_static(errindexlen_data, name = 'Error Index length')
        s_static(errindex_data, name = 'Error Index')
        s_static(varbiniden_data, name = 'Variable-Bindings Identifier')
        s_static(varbinlen_data, name = 'Variable-Bindings Length')
        
    with s_block(name = 'Variable-Bindings'):
        s_static(varnameiden_data, name = 'Variable-Name1 | Variable-Value1 Identifier')
        s_static(varnamelen_data, name ='Variable-Name1 | Variable-Value1 Length')
        s_static(objiden_data, name = 'Object Identifier')
        s_static(objlen_data, name = 'Object Length')
        s_bit_field(value_rawbytes2int(oid_data), width = len(oid_data)*8, endian = '>', full_range = False, name = 'Oid')
        s_static(valuenull_data, name = 'Type Null')
        
        

    session.connect(s_get("Request"))

    session.fuzz()


if __name__ == "__main__":
    main()
