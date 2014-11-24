#!/usr/bin/python
import web
render = web.template.render('./templates/')

urls = (
    '/gPXE', 'index',
)

class index:
    def GET(self):
        agent = web.ctx.env['HTTP_USER_AGENT']
        return render.boot()
#        raise web.seeother("GPXEBOOT/boot.gpxe")

#application = web.application(urls, globals()).wsgifunc()
if __name__ == "__main__":
    app = web.application(urls, globals())
    app.run()
