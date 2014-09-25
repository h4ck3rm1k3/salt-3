# document: http://blog.163.com/vic_kk/blog/static/4947052420087134143189/
# http://www.startos.com/ubuntu/tips/2010123019346.html
# https://help.ubuntu.com/community/LocalAptGetRepository
# http://davehall.com.au/blog/dave/2010/02/06/howto-setup-private-package-repository-reprepro-nginx
# http://blog.csdn.net/jianghuyue/article/details/6212601
# http://www.laxjyj.com/view-htm-tid-165612-cid-49.html
# http://troubleshootingrange.blogspot.com/2012/09/hosting-simple-apt-repository-on-centos.html
# http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM4Ent/4.5.1/Cloudera-Manager-Enterprise-Edition-Installation-Guide/cmeeig_topic_21_3.html
# http://joseph.ruscio.org/
dpkg-pkg:
  pkg.installed:
    - dpkg
    - dpkg-devel

create-mirror:
  cmd.script:
    - name: create-mirror.sh
    - source: salt://apt-mirror/create-mirror.sh > /dev/null
    - stateful: True
