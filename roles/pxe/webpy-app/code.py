#!/usr/bin/python
# coding: utf-8
import web
urls = (
    '/.*', 'hello',
    )

class hello:
    def GET(self):
        return "Hello, world."

#application = web.application(urls, globals()).wsgifunc()
if __name__ == "__main__":
    web.application(urls, globals()).run()
