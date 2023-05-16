import sqlalchemy as alch # python -m pip install --upgrade 'sqlalchemy<2.0'

def connection_to_sql ():
    password = ""
    dbName = "employees"
    connectionData=f"mysql+pymysql://root:{password}@localhost/{dbName}"
    engine = alch.create_engine(connectionData)
    return engine

def connection_to_sql_sakila ():
    password = ""
    dbName = "sakila"
    connectionData=f"mysql+pymysql://root:{password}@localhost/{dbName}"
    engine = alch.create_engine(connectionData)
    return engine

