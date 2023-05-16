from flask import Flask, jsonify, request
import random
import config.sql_connection as conn
import tools.sql_queries as queries
import pandas as pd

app = Flask (__name__)

@app.route("/")
def hello_this_works ():
    return f"API does work"

@app.route("/random")
def random_chois ():
    return random.choice(["Ramsés", "Paul", "Paula G"])

@app.route("/everything-employees")
def employees_full ():
    return queries.query_all_emp()

@app.route("/sakila/<limit>")
def sakila_full (limit):
    return queries.query_all_emp_sakila(limit)

@app.route("/table/<tablename>")
def sakila_random (tablename):
    limit = request.args["limit"]
    return queries.query_any_sakila_table(tablename, limit)

@app.route("/hi")
def say_hi ():
    print(f"These are your params: {request.args}")
    print("Also, hi!")
    return "hola"

@app.route("/signup", methods=["POST"])
def inserts_into_db ():
    
    dict_ = {
    "emp_no": request.args["emp_no"],
    "birth_date": request.args["birth_date"],
    "first_name": request.args["first_name"],
    "last_name": request.args["last_name"],
    "gender": request.args["gender"],
    "hire_date": request.args["hire_date"]
    } 

    return queries.insert_into_employees(dict_)


if __name__ == "__main__":
    app.run(debug=True)