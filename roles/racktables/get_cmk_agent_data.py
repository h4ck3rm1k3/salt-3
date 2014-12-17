#!/usr/bin/env python
import sys, os
import socket
import pprint

def get_agent_data(ipaddress, port):
    tcp_connect_timeout = 3
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

        try:
            s.settimeout(tcp_connect_timeout)
        except:
            pass # some old Python versions lack settimeout(). Better ignore than fail

        s.connect((ipaddress, port))

        try:
            s.setblocking(1)
        except:
            pass

        output = ""
        while True:
            out = s.recv(4096, socket.MSG_WAITALL)
            if out and len(out) > 0:
                output += out
            else:
                break
        s.close()

        return output
    except Exception, e:
        print e

def parse_info(lines):
    info = {}
    section = []
    section_options = {}
    separator = None
    for line in lines:
        # Found normal section header
        # section header has format <<<name:opt1(args):opt2:opt3(args)>>>
        if line[:3] == '<<<' and line[-3:] == '>>>':
            section_header = line[3:-3]
            headerparts = section_header.split(":")
            section_name = headerparts[0]
            section_options = {}
            for o in headerparts[1:]:
                opt_parts = o.split("(")
                opt_name = opt_parts[0]
                if len(opt_parts) > 1:
                    opt_args = opt_parts[1][:-1]
                else:
                    opt_args = None
                section_options[opt_name] = opt_args

            section = info.get(section_name, None)
            if section == None: # section appears in output for the first time
                section = []
                info[section_name] = section
            try:
                separator = chr(int(section_options["sep"]))
            except:
                separator = None

        elif line != '':
            section.append(line.split(separator))
    return info


ipaddress = '192.168.201.2'
port = 6556
output = get_agent_data(ipaddress, port)
lines = [ l.strip() for l in output.split('\n') ]
info = parse_info(lines)
pp = pprint.PrettyPrinter()
pp.pprint(info)
