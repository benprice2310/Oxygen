import json
from flask import Flask, request, jsonify


# Init Flask app
app = Flask(__name__, template_folder='templates', static_folder='static')


@app.route("/getJobNodes", methods = ['POST'])
def getJobNodes():
    data = request.form

    # fake distance checker
    if (data['latitude'] < "45" and data['latitude'] > "40") and (data['longitude'] > "-120" and data['longitude'] < "-130"):

        with open('data/JobData.json', 'r') as file:
            data = json.load(file)

        return data
    else:
        return []


@app.route("/getCourseNodes", methods = ['POST'])
def getCourseNodes():
    data = request.form

    # fake distance checker
    if (data['latitude'] < "45" and data['latitude'] > "40") and (data['longitude'] > "-120" and data['longitude'] < "-130"):

        with open('data/CourseData.json', 'r') as file:
            data = json.load(file)

        return data
    else:
        return []


if __name__ == '__main__':
    app.run(debug=False, ssl_context=('cert.pem', 'key.pem'))
