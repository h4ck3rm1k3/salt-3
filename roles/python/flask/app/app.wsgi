#!/usr/bin/env python
from flask import *
import time

app = Flask(__name__)

@app.route('/hello/')
@app.route('/hello/<name>')
def hello(name=None):
    return render_template('hello.html', name=name, time=time.ctime())

@app.route('/compute', methods=['POST', 'GET'])
def index():
    if request.method == 'POST':
        n = [request.form.get(x, 0, type=float) for x in ['n1','n2','n3']]
        return jsonify(max=max(n), min=min(n))
    else:
        return render_template('compute.html')

@app.route("/kickstart")
def kickstart():
    name = request.args.get('name', 'CentOS')
    familiy = get_family(name)
    arch = request.args.get('arch')
    version = request.args.get('ver')
    role = request.args.get('role')
    ks = get_ksfile(role, name)

    response = make_response(ks)
    response.headers["content-type"] = "text/plain"
    return response

def get_ksfile(role, os):
    family = get_family(os)
    unattend_file = 'ks_%s.html' % family
    ks = render_template(unattend_file, os=os, role=role)
    return ks 

def get_family(os):
    family = {
        'redhat': ['redhat', 'centos', 'xenserver'],
        'debian': ['debian', 'ubuntu'],
    }

    for f_name in family.keys():
      if os.lower() in family[f_name]:
         return f_name

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=81, debug=True)
