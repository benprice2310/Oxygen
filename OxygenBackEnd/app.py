import json
from flask import Flask, render_template, request


# Init Flask app
app = Flask(__name__, template_folder='templates', static_folder='static')


@app.route("/endpoint", methods = ['POST'])
def endpoint():

    return None


if __name__ == '__main__':
    app.run(debug=False, ssl_context=('cert.pem', 'key.pem'))
