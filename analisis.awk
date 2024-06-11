# Descripción: En este proyecto, u.lizaremos AWK para analizar un archivo de registro de
# accesos a un servidor web y extraer información relevante sobre el tráfico del si.o.

# Variables para estadísticas generales

BEGIN{
    total_requests = 0;
    total_response_size = 0;
}