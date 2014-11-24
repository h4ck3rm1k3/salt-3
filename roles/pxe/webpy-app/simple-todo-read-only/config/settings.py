#!/usr/bin/env python
# coding: utf-8
import web
web.config.debug = True

db = web.database(dbn='mysql', db='todo', user='root', pw='gdcloud.com')
render = web.template.render('templates/', cache=False)
config = web.storage(
    email='qichangxing@gmail.com',
    site_name = '任务跟踪',
    site_desc = '',
    static = '/static',
)

web.template.Template.globals['config'] = config
web.template.Template.globals['render'] = render
