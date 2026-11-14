import sqlite3
from flask import Flask, request, jsonify
import os
import db_manager
from constants import DB_FILE 

app = Flask(__name__)

app.config['DATABASE'] = os.path.join(app.instance_path, DB_FILE)

# Make sure the instance folder exists
os.makedirs(app.instance_path, exist_ok=True) # TO ADD

db_manager.init_flask(app)
app.url_map.strict_slashes = False
# TO RUN THE APP: flask --app app run --debug
# OR py -m flask --app app run --debug

@app.route("/health")
def health():
    return "Running!"