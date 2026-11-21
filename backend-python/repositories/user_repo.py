from db_manager import get_db

def get_users():
    db = get_db()
    row = db.execute(
        "SELECT id, email FROM users"
    ).fetchall()