def test(cmd):
    return __salt__['cmd.run'](cmd)
# usage: salt '*'  custom.test ls
