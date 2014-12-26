#!/usr/bin/env python
import optparse
import os, sys
import pycurl
import StringIO
import ConfigParser

def make_grub_conf(os='CentOS', arch='x86_64', version='6.3', kargs=''):
    grub_tmpl = '''
default=0
timeout=5
title Install_{0}-{1}-{2}
        root (hd0,0)
        kernel /_vmlinuz {3}
        initrd /_initrd.img
'''.format(os, arch, version, kargs)
    grub_conf = '/boot/grub/grub.conf_install'
    with open(grub_conf, 'w') as f:
        f.write(grub_tmpl)

def curl_handler(url):
    c = pycurl.Curl()
    c.setopt(pycurl.URL, url)
    c.setopt(pycurl.CONNECTTIMEOUT, 60)
    return c

def read_grub_conf(grub_conf='/boot/grub/grub.conf'):
    lines = file(grub_conf).readlines()
    grub = {}
    menu_items = []
    menu = {'title': ''}
    for line in lines:
      if not line.startswith('#') and len(line) > 2:
        line = line.strip('\n')
        line = line.strip()
        if line.startswith('title'):
            title = line.split(' ', 1)
            menu['title'] = title[1]
        elif menu['title'] != '':
           key, val = line.split(' ', 1)
           if key.lower() in ['kernel', 'linux']:
               menu['kernel'] = val
           elif key.lower() == 'root':
               menu['root'] = val
           elif key.lower() == 'initrd':
               menu['initrd'] = val
               menu_items.append(menu)
        elif line.startswith('default='):
           key, val = line.split('=')
           grub['default'] = val
        elif line.startswith('timeout='):
           key, val = line.split('=')
           grub['timeout'] = val
        elif line.startswith('splashimage='):
           key, val = line.split('=')
           grub['splashimage'] = val
    grub['menus'] = menu_items
    return grub

def write_ksfile(os):
    ksurl = '%s?os=%s&ver=%s&role=%s' % (os['url'], os['os'], os['ver'], os['role'])
    c = curl_handler(ksurl)
    io = StringIO.StringIO()
    c.setopt(pycurl.WRITEFUNCTION, io.write)
    try:
        c.perform()

        ks_data = io.getvalue()
        ks_file = '/boot/%s-%s-%s-%s-%s.ks' % (os['family'], os['os'], os['ver'], os['arch'], os['role'])

        with open(ks_file, 'w') as f:
            f.write(ks_data)
        print 'answerfile saved: %s' % ks_file
    except Exception, e:
        print 'Error: %s' % e
        sys.exit(1)


def download_bootfiles(os):
    k_url = '%s/os/Linux/%s/%s/%s/%s/%s' % (os['boot'], os['family'], os['os'], os['arch'], os['ver'], os['kernel'])
    k_file = '/boot/%s-%s-%s-%s.vmlinuz' % (os['family'], os['os'], os['ver'], os['arch'])
    outfile = file(k_file, 'wb')
    c = curl_handler(k_url)
    c.setopt(pycurl.WRITEFUNCTION, outfile.write)
    print 'downloading: %s' % k_url
    c.perform()
    print 'file saved: %s' % k_file

    i_file = '/boot/%s-%s-%s-%s.initrd.img' % (os['family'], os['os'], os['ver'], os['arch'])
    i_url = '%s/os/Linux/%s/%s/%s/%s/%s' % (os['boot'], os['family'], os['os'], os['arch'], os['ver'], os['initrd'])
    outfile = file(i_file, 'wb')
    c = curl_handler(i_url)
    c.setopt(pycurl.WRITEFUNCTION, outfile.write)
    print 'downloading: %s' % i_url
    c.perform()
    print 'file saved: %s' % i_file

def read_conf(config_file):
    cp = ConfigParser.ConfigParser()
    cp.read(config_file)
    inst = {}
    for os in cp.sections():
        if cp.get(os, 'default') == '1':
             inst['os'] = os
             inst['kernel'] = cp.get(os, 'kernel')
             inst['initrd'] = cp.get(os, 'initrd')
             inst['version'] = cp.get(os, 'version')
             inst['arch'] = cp.get(os, 'arch')
             inst['role'] = cp.get(os, 'role')
             inst['source'] = cp.get(os, 'source')
             inst['answerfile'] = cp.get(os, 'answerfile')
    return inst
    
def get_options():
    parser = optparse.OptionParser()
    parser.add_option('', '--config', dest='config', default='', help='config file for os installation[default: %default]', metavar='install_os.conf',type='str')
    parser.add_option('', '--kernel', dest='kernel', default='vmlinuz', help='kernel name[default: %default]', metavar='vmlinuz',type='str')
    parser.add_option('', '--initrd', dest='initrd', default='initrd.img', help='initrd name[default: %default]', metavar='initrd.img',type='str')
    parser.add_option('', '--os', dest='os', default='CentOS', help='os name: CentOS or RedHat', metavar='CentOS',type='str')
    parser.add_option('', '--version', dest='version', default='6.3', help='os version[default: %default]', metavar='6.3')
    parser.add_option('', '--arch', dest='arch', default='x86_64', help='os arch[default: %default]', metavar='x86_64')
    parser.add_option('', '--role', dest='role', default='minimal', help='kickstart role [default: %default]', metavar='minimal')
    parser.add_option('', '--source', dest='source', default='http://ftp01.hdtr.com', help='os install source[default: %default]')
    parser.add_option('', '--answerfile', dest='answerfile', default='kickstart.ks', help='kickstart file source[default: %default]',metavar='kickstart.ks')
    
    (inst, args) = parser.parse_args()
    return inst

if __name__ == '__main__':
    options = {}
    inst = get_options()

    if inst.config != '':
        options = read_conf(inst.config)
    else:
        options['os'] = inst.os
        options['version'] = inst.version
        options['role'] = inst.role
        options['source'] = inst.source
        options['answerfile'] = inst.answerfile
        options['kernel'] = inst.kernel
        options['initrd'] = inst.initrd

        for key in ['os', 'kernel', 'initrd', 'arch', 'version']:
          if key == '':
            sys.exit('Invalid value of: %s' % key)

        if inst.os in ['CentOS', 'RedHat']:
            options['family'] = 'RedHat'
        else:
            sys.exit('os name must be RedHat or CentOS')
        if inst.arch in ['x86_64', 'i386']:
            options['arch'] = inst.arch
        else:
            sys.exit('os name must be x86_64 or i386')

    make_grub_conf(os=options['os'], version=options['version'], arch=options['arch'])
