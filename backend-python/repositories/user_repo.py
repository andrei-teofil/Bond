from db_manager import get_db

USER_ATB=["id", "username", "first_name", "last_name", "date_of_birth", "email", "password"]

USER_SELECT = ','.join(USER_ATB)
# resulted string: "id,username,..."

def get_users():
    db = get_db()
    rows = db.execute(
        f"SELECT {USER_SELECT} FROM users"
    ).fetchall()

    # list comprehension
    # [i*2 for i in range(1,5)] --> [2,4,6,8]
    userDicts = [dict(row) for row in rows]
    return userDicts

def get_user_by_id(id: int):
    db = get_db()
    row = db.execute(
        f"SELECT {USER_SELECT} FROM users WHERE id = ?", (id,)
    ).fetchone()

    return dict(row) if row else None