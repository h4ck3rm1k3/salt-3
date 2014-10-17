#!/usr/bin/python
import web
#import webbrowser 
urls = ('/'  ,'Index' , '/upload', 'Upload')

class Upload:
	def GET(self):
		return """<html><head><title>web.py test</title></head><body>
			<form method="POST" action=""  enctype="multipart/form-data" >
			username:<input type="text" name="un" value=""/></br>
			passwd:<input type="password" name="pwd" value=""/></br>
			<select name="adserver_id" id="adserver_id" multiple=""></br>
				<option value="1">centos</option>
				<option value="2">ubuntu</option>
				<option value="3">windows</option>
				<option value="4">other</option>
			</select></br>
			<input type="file" name="myfile" /></br>
			<input type="submit" value="submit"/>
			</form>
			</body></html>"""

	def POST(self):
		x = web.input(myfile={})
		return "filename: %s\n value: \n%s" % (x['myfile'].filename, x['myfile'].value) 
		'''
		
		x = web.input()
		data = u'<h1>user name:%s <br>password:%s <br>adserver_id:%s</h1>' % (x.un,x.pwd,x.adserver_id)
		return data.encode('gbk')
		'''

class Index():	
	
	def GET(self):
		
		print '='*60
		return  u"""<html><head><title>web.py test</title></head><body><h1 align="center"><a href="/upload">upload</a></h1></body></html>
""".encode('gbk')
				
if __name__ == "__main__":
	#webbrowser.open('http://192.168.11.9:8080')
	app = web.application(urls, globals(),True) 
	app.run()
