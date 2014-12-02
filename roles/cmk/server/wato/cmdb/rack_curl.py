#!/usr/bin/env python
import sys, os
import StringIO
import pycurl, urllib
import re


type = {
    '4': 'Server',
    '5': 'DiskArray',
    '7': 'Router',
    '8': 'Nework Switch',
    '798': 'Nework Security',
    '1504': 'VM',
}

def get_objects():
    url = 'http://racktables/racktables/api.php?'
    params = {
        'username': 'admin',
        'password': 'gdcloud.com',
        'method': 'get_depot'
    }
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
        print html

        b.close()
        c.close()
    
    except pycurl.error, error:
        errno, errstr = error
        print 'An error occurred: ', errstr

get_objects()
