#!/usr/bin/python
#sms_5c.py
import sys, os
import StringIO
import pycurl, urllib
import re

def get_content():
   message = ''
   message = "{0}:{1}\n{2}: {3} -> {4}\n{5}".format(
   os.environ['NOTIFY_NOTIFICATIONTYPE'], os.environ['NOTIFY_SHORTDATETIME'],
   os.environ['NOTIFY_HOSTNAME'], os.environ['NOTIFY_LASTHOSTSTATE'], os.environ['NOTIFY_HOSTSTATE'],
   os.environ['NOTIFY_HOSTOUTPUT']
)
    return message

def send_SMS():
    url = 'http://m.5c.com.cn/api/send/?'
    params = {
        'username': 'hdtr',
        'password': '123456',
        'apikey': '8d683e752ec57d1bf38f46ca6c562b19'
    }
    params['mobile'] = os.environ['NOTIFY_CONTACTPAGER']
    params['content'] = get_content()
    post_data = urllib.urlencode(params)

    c = pycurl.Curl()
    c.setopt(pycurl.URL, url)
    c.setopt(pycurl.POST, 1)
    c.setopt(pycurl.CONNECTTIMEOUT, 60)
    c.setopt(c.POSTFIELDS, post_data)
    
    try:
        b = StringIO.StringIO()
        c.setopt(c.WRITEFUNCTION, b.write)
        c.perform()
        html=b.getvalue()
        #output example:
        # success:14137935489362
        if re.match('success', html):
            print "!!!!!!!!!! OK: send_SMS Sucessfully !!!!!!!!!!"
        else:
            print "!!!!!!!!!! ERROR: send_SMS Failed !!!!!!!!!!"

        b.close()
        c.close()
    
    except pycurl.error, error:
        errno, errstr = error
        print 'An error occurred: ', errstr

send_SMS()
