from proyectoAero.conexion import creaconexionsql
from django.shortcuts import render

import pymssql
import pandas as pd

def SP_AeropuertoMayorMovimiento_Anio(Anio):

    conn = None
    conn = creaconexionsql()

    try:
        c = conn.cursor()
        proc_almacenado = "SP_AeropuertoMayorMovimiento_Anio"
        c.callproc(proc_almacenado, (Anio,))

        if c.description is not None:
            column_names = [desc[0] for desc in c.description]
            resultados = c.fetchall()

            df = pd.DataFrame.from_records(resultados, columns=column_names)
            
        else:
            df = None

        return df
    
    except pymssql.Error as err:
        print(err)
        pass
    finally:
        c.close()
        conn.close()


def SP_AerolineaMayorVuelos_Anio(Anio):

    conn = None
    conn = creaconexionsql()

    try:
        c = conn.cursor()
        proc_almacenado = "SP_AerolineaMayorVuelos_Anio"
        c.callproc(proc_almacenado, (Anio,))

        if c.description is not None:
            column_names = [desc[0] for desc in c.description]
            resultados = c.fetchall()

            df = pd.DataFrame.from_records(resultados, columns=column_names)
            
        else:
            df = None

        return df
    
    except pymssql.Error as err:
        print(err)
        pass
    finally:
        c.close()
        conn.close()


def SP_DiaMayorVuelos():

    conn = None
    conn = creaconexionsql()

    try:
        c = conn.cursor()
        proc_almacenado = "SP_DiaMayorVuelos"
        c.callproc(proc_almacenado)

        if c.description is not None:
            column_names = [desc[0] for desc in c.description]
            resultados = c.fetchall()

            df = pd.DataFrame.from_records(resultados, columns=column_names)
            
        else:
            df = None

        return df
    
    except pymssql.Error as err:
        print(err)
        pass
    finally:
        c.close()
        conn.close()



def SP_AerolineaMayorDosVuelos_Dia():

    conn = None
    conn = creaconexionsql()

    try:
        c = conn.cursor()
        proc_almacenado = "SP_AerolineaMayorDosVuelos_Dia"
        c.callproc(proc_almacenado)

        if c.description is not None:
            column_names = [desc[0] for desc in c.description]
            resultados = c.fetchall()

            df = pd.DataFrame.from_records(resultados, columns=column_names)
            
        else:
            df = None

        return df
    
    except pymssql.Error as err:
        print(err)
        pass
    finally:
        c.close()
        conn.close()
