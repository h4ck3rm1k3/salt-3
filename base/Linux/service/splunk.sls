splunk:
  pkg:
    - name: splunk-6.1.1-207789-linux-2.6-x86_64.rpm
    - source: salt://service/splunk/splunk-6.1.1-207789-linux-2.6-x86_64.rpm
    - installed
  cmd:
    - run
    - name: /opt/splunk/bin/splunk enable boot-start > /dev/null
    - stateful: True
    - require:
      - pkg: splunk-6.1.1-207789-linux-2.6-x86_64.rpm
  service:
    - name: splunk
    - running
    - enable: True
    - require:
      - cmd: /opt/splunk/bin/splunk enable boot-start > /dev/null
