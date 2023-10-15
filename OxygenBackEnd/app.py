import json
from flask import Flask, request, jsonify


# Init Flask app
app = Flask(__name__, template_folder='templates', static_folder='static')


@app.route("/getJobNodes", methods = ['POST'])
def getJobNodes():
    data = request.form

    try:
        # fake distance checker
        if (data['latitude'] < 45 and data['latitude'] > 40) and (data['longitude'] > "-120" and data['longitude'] < "-130"):
            return jsonify(getData['jobs'])
        else:
            return jsonify([])

    except:
        return jsonify(getData())



@app.route("/getCourseNodes", methods = ['POST'])
def getCourseNodes():
    data = request.form

    try:
        # fake distance checker
        if (data['latitude'] < "45" and data['latitude'] > "40") and (data['longitude'] > "-120" and data['longitude'] < "-130"):
            return jsonify(getData['courses'])
        else:
            return jsonify([])
    except:
        return jsonify(getData())


def getData(keyThing=""):
    with open('data/AllData.json', 'r') as file:
        data = json.load(file)

    if keyThing != "":
        return data[keyThing]

    return data




if __name__ == '__main__':
    app.run(debug=False, ssl_context=('cert.pem', 'key.pem'))
