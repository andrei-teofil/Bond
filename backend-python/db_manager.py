import os
import sqlite3
from flask import g, current_app

def get_db():
    g.db = sqlite3.connect(
        current_app.config['DATABASE'],
        detect_types=sqlite3.PARSE_DECLTYPES
    )

    # to be able to access by column names
    g.db.row_factory = sqlite3.Row

    return g.db

def init_db():
    db = get_db()

    with current_app.open_resource('schema.sql') as f:
        db.executescript(f.read())

def close_db():
    db = g.pop('db', None)

    if db is not None:
        db.close()

def init_flask(app):
    # Registers clean-up and CLI(Command Line Interface) flask commands
    app.teardown_appcontext(close_db)

    # can be run with "flask init-db"
    @app.cli.command('init-db')
    def init_flask_db_command():
        init_db()
