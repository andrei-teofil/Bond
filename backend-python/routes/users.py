from flask import Blueprint, jsonify

users_bp = Blueprint("users", __name__)

# HTTP METHODS:
# GET = primesc date
# POST = creez date noi
# PUT = inlocuiesc date (total) cu alte date
# PATCH = actualizez (partial) date
# DELETE = sterg date
@users_bp.route("", methods=["GET"])
def get_users():
    return jsonify([]), 200