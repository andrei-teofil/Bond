from flask import Blueprint, jsonify
from repositories import user_repo

users_bp = Blueprint("users", __name__)

# HTTP METHODS:
# GET = primesc date
# POST = creez date noi
# PUT = inlocuiesc date (total) cu alte date
# PATCH = actualizez (partial) date
# DELETE = sterg date
@users_bp.route("", methods=["GET"])
def get_users():
    users = user_repo.get_users()
    return jsonify(users), 200

@users_bp.route("/<int:id>", methods=["GET"])
def get_user(id):
    user = user_repo.get_user_by_id(id)
    
    if user is None:
        return jsonify({"error" : "User not found"}), 404

    return jsonify(user), 200