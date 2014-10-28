sls_vim:
  file:
    - recurse
    - name: ~/.vim
    - source: salt://service/vim/plugins
    - mkdirs: True

