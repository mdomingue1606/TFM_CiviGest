# Repositorio TFM_CiviGest
Repositorio que incluye todo el código desarrollado de CiviGest para el Trabajo de Fin de Máster.

# Composición del repositorio
En concreto este proyecto se compone de los siguientes archivos y directorios:
* **db**: directorio compuesto por los archivos de configuración y de población de la bbdd de docker.
* **keys**: directorio donde se guardan las keys de los contenedores, para que las contraseñas de los usuarios generados por la base de datos puedan ser utilizadas.
* **AuthUtility.zip**: Zip con el servicio de utilidad de Auth Utility.
* **BasicGest.zip**: Zip con el proyecto de Basic Gest. Que está compuesto por el servicio de usuario y de proveedores
* **Despliegue Civigest.ps1**: Script de powershell para crear las imagenes de docker y levantar los servicios.
* **Levantar MySQL.ps1**: Script para levantar la base de datos local del proyecto.
* **LibraryGest.zip**: Zip con el proyecto de Library Gest. Que está compuesto por el servicio de pedido, libro, biblioteca, archivo online y autor.
* **MemberGest.zip**: Zip con el proyecto de Member Gest. Que está compuesto por el servicio de préstamo y reserva.
* **NotificationUtility.zip**: Zip con el servicio de utilidad de Notification Utility.
* **Readme.md**: este documento explicativo.

# Levantar proyecto
Para levantar este proyecto es necesario disponer de una configuración funcional de Docker. Una vez teniendo esta configuración solo seria necesario utilizar el script de "Despliegue CiviGest.ps1", el cual realizará las siguientes tareas:
1. Cerrara cualquier servidor de MySQL local que pueda haber en el sistema.
2. Creara de una en una todas las imagenes de los servicios.
3. Levantara con docker-compose todo el proyecto en segundo plano.
