from flask import Flask
app = Flask(__name__)

@app.route("/")
def start():
    return "EPOS Workflow Service"


@app.route("/cwltool/")
def cwltool():
    return "cwltool implementation..."