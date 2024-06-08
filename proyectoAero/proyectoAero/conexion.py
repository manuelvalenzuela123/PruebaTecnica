import pymssql

def creaconexionsql():
    conn = pymssql.connect(server='DESKTOP-7C1N4UT\MANUEL', database='AerolineaMexico')
    return conn

