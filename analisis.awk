# Descripción: En este proyecto, u.lizaremos AWK para analizar un archivo de registro de
# accesos a un servidor web y extraer información relevante sobre el tráfico del si.o.

# Normalmente, un archivo de registro de acceso al servidor web sigue un formato común que incluye información como la dirección IP del cliente, la fecha y hora de la solicitud, el método de la solicitud HTTP, el recurso solicitado, el código de estado de la respuesta y el tamaño de la respuesta.
# ejemplo: 127.0.0.1 - - [01/Jan/2023:12:00:00 +0000] "GET /index.html HTTP/1.1" 200 1024

# Variables para estadísticas generales

BEGIN{
    total_requests = 0; # Total de peticiones
    total_response_size = 0; # Total de bytes transferidos
    errors_client = 0; # Total de errores de cliente (400-499)
    errors_server = 0; # Total de errores de servidor (500-599)
}

# Regla para procesar cada línea del archivo de registro
{
    # Incrementar el total de peticiones
    total_requests += 1;

    # Incrementar el tamaño total de tamano de la respuesta
    total_response_size += $10;
    # print $1 " " $6 " " $7 " " $9 " " $10;

    # Extraer recursos solicitados
    resource = $7; # este es el recurso solicitado
    resources[resource] += 1; # este es un diccionario que mapea recursos a la cantidad de veces que se solicitaron
    # print resource " " $10 " " resources[resource];

    # Extraer direcciones IP 
    ip = $1; # esta es la dirección IP del cliente
    ips[ip] += 1; # este es un diccionario que mapea direcciones IP a la cantidad de veces que se solicitaron
}


# Generación del informe
END {
    print "Estadísticas Generales:";
    print "Número total de solicitudes:", total_requests;
    print "Tamaño total de respuestas:", total_response_size, "bytes";
    print "Número total de errores de cliente:", errors_client;
    print "Número total de errores de servidor:", errors_server;
    
    print "\nRecursos más solicitados:";
    for (resource in resources) { # bucle for para iterar sobre los recursos solicitados for (clave in diccionario)
        print resource ":", resources[resource], "solicitudes";
    }
    
    print "\nDirecciones IP Únicas:";
    for (ip in ips) {
        print ip ":", ips[ip], "solicitudes";
    }
    
}
