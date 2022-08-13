from flask import Flask, request, jsonify
import pyrebase

app = Flask(__name__)


firebaseConfig = {
    "apiKey": "AIzaSyDPDD_CH811K1Gc_vuPb5WdgBzKuLcZJvA",
    "authDomain": "greenjar-dfdf5.firebaseapp.com",
    "projectId": "greenjar-dfdf5",
    "storageBucket": "greenjar-dfdf5.appspot.com",
    "messagingSenderId": "520426294090",
    "appId": "1:520426294090:web:ee3c8768defb615a5acfb3",
    "measurementId": "G-JMXS5JEY15",
    "databaseURL": "https://greenjar-dfdf5-default-rtdb.firebaseio.com/"
}

firebase = pyrebase.initialize_app(firebaseConfig)

db = firebase.database()

@app.route("/", methods=["POST"])
def hello_world():

    data = request.get_json()
    

    return jsonify({"CodeName":data["CodeName"],"Password":data["Password"]})


if __name__ == '__main__':
    app.run(debug=True)