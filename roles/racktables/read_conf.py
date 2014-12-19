#!/usr/bin/env python
import os, sys
import re, pprint

conf = './config.0'
c_comment = '^#'
pp = pprint.PrettyPrinter()

# delete blank lines in conf
def get_conf():
  with open(conf) as f:
    lines = f.readlines()
    new_lines = []
    for index, line in enumerate(lines):
      if re.match('\n', line):
        del lines[index]
    for line in lines:
      new_lines.append(line.rstrip())

  return new_lines

def get_sections():
    lines = get_conf()
    sections = []
    new_lines = []
    comment = []
    for line in lines:
      if re.match(c_comment, line):
        comment.append(line)
        continue
      elif not re.match(c_comment, line):
        if re.match('^!', line):
            continue
        else:
            if not re.match('^exit', line):
                new_lines.append(line)
            else:
                sections.append(new_lines)
                new_lines = []

    return sections

def get_services():
  sections = get_sections()
  rules = []
  for section in sections:
    if len(section) > 1 and section[0].startswith('service'):
      rules.append(section)

  return rules

def get_servgroups():
  sections = get_sections()
  rules = []
  for section in sections:
    if len(section) > 1 and section[0].startswith('servgroup'):
      rules.append(section)

  return rules

def get_addresses():
  sections = get_sections()
  rules = []
  for section in sections:
    if len(section) > 1 and section[0].startswith('address id'):
      rules.append(section)

  return rules


def get_policies():
  sections = get_sections()
  rules = []
  for section in sections:
    if len(section) > 1 and section[0].startswith('rule id'):
      rules.append(section)
  return rules

def get_dnats():
  sections = get_sections()
  rules = []
  for section in sections:
    if len(section) > 1 and section[0].startswith('ip vrouter'):
      for s in section[1:]:
        s = s.lstrip()
        if s.startswith('dnatrule id'):
          rules.append(s)
  return rules

def get_snats():
  sections = get_sections()
  rules = []
  for section in sections:
    if len(section) > 1 and section[0].startswith('ip vrouter'):
      for s in section[1:]:
        s = s.lstrip()
        if s.startswith('snatrule id'):
          rules.append(s)
  return rules

def get_routes():
  sections = get_sections()
  rules = []
  for section in sections:
    if len(section) > 1 and section[0].startswith('ip vrouter'):
      for s in section[1:]:
        s = s.lstrip()
        if s.startswith('ip route'):
          rules.append(s)
  return rules

def policy_to_dict():
    rules = get_policies()
    rule_dict = {}
    for rule in rules:
        rule_id = rule[0].split(' ')[-1]
        lines = rule[1:]
        rule_dict[rule_id] = {}
        for line in lines: 
            line = line.strip()
            key = line.split(' ')[0]
            val = line.split(' ')[1:].strip('"')
            rule_dict[rule_id][key] = val
    return rule_dict

def addresses_to_dict():
    rules = get_addresses()
    rule_dict = {}
    for rule in rules:
        rule_header = rule[0]
        rule_id = rule_header.split(' ')[2]
        rule_name = rule_header.split(' ')[-1]
        lines = rule[1:]
        rule_dict[rule_id] = {}
        for line in lines: 
            line = line.strip()
            key = line.split(' ')[0]
            val = line.split(' ')[-1].strip('"')
            rule_dict[rule_id][key] = val
    return rule_dict

def services_to_dict():
    rules = get_services()
    rule_dict = {}
    for rule in rules:
        rule_header = rule[0]
        rule_name = rule_header.split()[1].strip('"')
        lines = rule[1:]
        rule_dict[rule_name] = {}
        rule_dict[rule_name]['tcp'] = []
        rule_dict[rule_name]['udp'] = []
        for line in lines: 
            line = line.strip()
            if line.startswith('description'):
                desc = line.split()[-1].strip('"')
                rule_dict[rule_name]['description'] = desc
            else:
                proto_type = line.split()[0]
                dst_port = line.split()[2]
                rule_dict[rule_name][proto_type].append(dst_port)
    return rule_dict

def servgroups_to_dict():
    rules = get_servgroups()
    rule_dict = {}
    for rule in rules:
        rule_header = rule[0]
        rule_name = rule_header.split()[1].strip('"')
        lines = rule[1:]
        service_names = []
        for line in lines:
            line = line.strip()
            if line.startswith('service'):
                s_name = line.split()[-1].strip('"')
                service_names.append(s_name)
        rule_dict[rule_name] = service_names
    return rule_dict

def dnat_to_dict():
    s_dicts = services_to_dict()
    rules = get_dnats()
    rule_dict = {}
    for rule in rules:
        info = rule.split()
        rule_id = info[2]
        rule_dict[rule_id] = {}
        rule_content = info[3:]
        for i, r in enumerate(rule_content):
            if r == 'from':
                _from = rule_content[i+1]
                rule_dict[rule_id]['from'] = _from
            elif r == 'to':
                to = rule_content[i+1]
                rule_dict[rule_id]['to'] = to
            elif r == 'service':
                service = rule_content[i+1].strip('"')
                rule_dict[rule_id]['service'] = service
            elif r == 'trans-to':
                trans_to = rule_content[i+1]
                rule_dict[rule_id]['trans_to'] = trans_to
            elif r == 'port':
                port = rule_content[i+1]
                rule_dict[rule_id]['port'] = port
            elif r == 'log':
                log = True
                rule_dict[rule_id]['log'] = True
    return rule_dict
