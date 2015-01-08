#!/usr/bin/python
# -*- coding:utf8 -*-
#sms_5c.py
import sys, os
import StringIO
import pycurl, urllib
import commands

def signature(content):
    signature = '【华电天仁】'
    signature = unicode(signature, 'utf-8')
    signature = signature.encode('utf-8')
    content = '%s\n%s\n' % (content, signature)
    return content

def send_sms(username, password, apikey, mobile, content):
    url = 'http://m.5c.com.cn/api/send/?'
    params = {
        'username': username,
        'password': password,
        'apikey': apikey,
        'mobile': mobile, 
        'content': signature(content)
    }
    post_data = urllib.urlencode(params)
    c.setopt(pycurl.URL, url)
    c.setopt(c.POSTFIELDS, post_data)
    
    try:
        b = StringIO.StringIO()
        c.setopt(c.WRITEFUNCTION, b.write)
        c.perform()
        html=b.getvalue()
        return html
        b.close()
        c.close()
    
    except pycurl.error, error:
        errno, errstr = error
        print 'An error occurred: ', errstr

def query_sms(username, password, apikey):
    url = 'http://m.5c.com.cn/api/query/?'
    params = {
        'username': username,
        'password': password,
        'apikey': apikey,
    }
    post_data = urllib.urlencode(params)
    c.setopt(pycurl.URL, url)
    c.setopt(c.POSTFIELDS, post_data)
    
    try:
        b = StringIO.StringIO()
        c.setopt(c.WRITEFUNCTION, b.write)
        c.perform()
        html=b.getvalue()
        return html
        b.close()
        c.close()
    
    except pycurl.error, error:
        errno, errstr = error
        print 'An error occurred: ', errstr

c = pycurl.Curl()
c.setopt(pycurl.POST, 1)
c.setopt(pycurl.CONNECTTIMEOUT, 60)

username = 'hdtr'
password = 'Tianren.SMS'
apikey = '8d683e752ec57d1bf38f46ca6c562b19'
mobile = '15117985354,15810076742,13718981491,18610455950,15210662599'

omd_status = commands.getoutput('omd status')
sms_balance = query_sms(username, password, apikey)
sms_date = commands.getoutput("date '+%T'")
content = '''
%s
<<<SMS balance>>>
%s
''' % (sms_date, sms_balance)

send_result = send_sms(username, password, apikey, mobile, content)
sms_balance = query_sms(username, password, apikey)
print 'result: %s;content: %s;sms_balance: %s' % (send_result, content, sms_balance)
