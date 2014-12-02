alias_gau:
  cmd.run:
    - name: echo "alias gau='git add -u .'" >> ~/.bashrc
    - stateful: True
    - unless: grep -q gau ~/.bashrc

alias_gcm:
  cmd.run:
    - name: echo "alias gcm='git commit -a'" >> ~/.bashrc
    - stateful: True
    - unless: grep -q gcm ~/.bashrc

alias_gpsh:
  cmd.run:
    - name: echo "alias gpsh='git push'" >> ~/.bashrc
    - stateful: True
    - unless: grep -q gpsh ~/.bashrc

source_bashrc:
  cmd.run:
    - name: source ~/.bashrc
    - stateful: True
