from proyectoAero.conexion import creaconexionsql
from django.shortcuts import render

import pymssql
import pandas as pd

from proyectoAero.consultas import *
from django.http import JsonResponse


def InicioVista(request):
    return render(request, 'inicio.html')


def Consultas(request):
    
    Bandera = request.GET.get('Bandera', None)

    Anio = request.GET.get('AnioParam', 2021)  

    df_AeropuertoMayorMovimiento = SP_AeropuertoMayorMovimiento_Anio(Anio)

    df_AerolineaMayorVuelos = SP_AerolineaMayorVuelos_Anio(Anio)

    df_DiaMayorVuelos = SP_DiaMayorVuelos()

    df_AerolineaDosVuelosDia = SP_AerolineaMayorDosVuelos_Dia()

    datos = {
        'AeropuertoMayorMovimiento': df_AeropuertoMayorMovimiento.to_dict(orient='records') if df_AeropuertoMayorMovimiento is not None else[],

        'AerolineaMayorVuelos': df_AerolineaMayorVuelos.to_dict(orient='records') if df_AerolineaMayorVuelos is not None else[],

        'DiaMayorVuelos': df_DiaMayorVuelos.to_dict(orient='records') if df_DiaMayorVuelos is not None else[],

        'AerolineaDosVuelosDia': df_AerolineaDosVuelosDia.to_dict(orient='records') if df_AerolineaDosVuelosDia is not None else[]
    }

    if Bandera == 'JS':
        return JsonResponse(datos)
    else:
        return render(request, 'Consultas.html', {'datos': datos})
    