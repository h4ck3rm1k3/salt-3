bash_PS1:
  cmd.run:
    - name: echo 'export PS1="\[\e[1;32m\]\u\[\e[m\]\[\e[1;33m\]@\[\e[m\]\[\e[1;35m\]\h\[\e[m\]:\w\$ "' >> ~/.bashrc
    - unless: grep -q PS1 ~/.bashrc
    - stateful: True
