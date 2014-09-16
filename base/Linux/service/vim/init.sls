vim:
  pkg.installed:
    - name: {{ pillar['vim'] }}

echo "alias vi='vim'" >> ~/.bashrc:
  cmd.run:
    - unless: grep -q vim ~/.bashrc
    - require:
      - pkg: {{ pillar['vim'] }}
