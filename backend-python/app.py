import sqlite3
from flask import Flask, request, jsonify
import os
import db_manager

app = Flask(__name__)

app.config['DATABASE'] = os.path.join(app.instance_path, 'bond.db')

db_manager.init_flask(app)

@app.route("/health")
def health():
    return "Running!"