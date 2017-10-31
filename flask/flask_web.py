from flask import Flask
app = Flask(__name__)


''' gunicorn entry '''
def bootstrap_app():
	return app


@app.route("/")
def start():
    return "EPOS Workflow Service"


@app.route("/cwltool/")
def cwltool():
    return "cwltool implementation..."