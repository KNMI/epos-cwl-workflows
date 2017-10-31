from flask import Flask
import subprocess


'''
  ...
''' 

app = Flask(__name__)


''' gunicorn entry '''
def bootstrap_app():
  return app


@app.route("/")
def start():
    return "EPOS Workflow Service"

@app.route("/cwlrunner/")
def cwlrunner():

  try:
    process = subprocess.Popen( "cwltool --version"  , shell=True).communicate() 

    return process
  except Exception as e:
    return e

    return "cwl-runner ..."

@app.route("/cwltool/")
def cwltool():
    return "cwltool implementation..."