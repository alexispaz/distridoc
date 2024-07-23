# distridoc
Scripts para realizar la distribución docente de profesores auxiliares en comisiones

# uso
El script `run.sh` ejecuta muchas veces el algoritmo Top Trading Cycle para diferentes semillas iniciales. 
Luego ordena las soluciones encontradas. Aquellas soluciones donde la suma de las preferencias utilizadas sea minima serán las mas convenientes.

# known issues

No puede distinguir si un profesor da dos comisiones ni que dos comisiones se dicten en el mismo horario, por lo que puede generar soluciones imposibles donde un profesor sea asignado a 2 comisiones simultáneas.
