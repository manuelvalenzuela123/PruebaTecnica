import pymssql

def creaconexionsql():
    conn = pymssql.connect(server='DESKTOP-A9QVKQG', database='AerolineaMexico')
    return conn
