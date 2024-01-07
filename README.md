# MediaWiki Docker Compose

Este repositorio contiene un archivo docker-compose.yml para configurar un entorno de desarrollo local de MediaWiki utilizando una base de datos MySQL y una imagen de MediaWiki. Además, se incluye un archivo LocalSettings.php preconfigurado con las configuraciones necesarias para la base de datos, directorios y archivos de MediaWiki.

## Requisitos previos

Asegúrate de tener los siguientes requisitos previos instalados en tu máquina:

- Docker: [Instrucciones de instalación](https://docs.docker.com/install/)
- Docker Compose: [Instrucciones de instalación](https://docs.docker.com/compose/install/)

## Configuración

Antes de ejecutar la aplicación, es necesario configurar algunos parámetros. Sigue los pasos a continuación:

1. Abre el archivo 'LocalSettings.php` ubicado en la carpeta '/var/www/html/'.
2. Actualiza las configuraciones según tus necesidades. Asegúrate de proporcionar la información correcta de la base de datos, directorios y archivos de MediaWiki.

   // Configuración de la base de datos
   $wgDBserver = "mysql";
   $wgDBname = "mediawiki";
   $wgDBuser = "root";
   $wgDBpassword = "password";

   // Configuración de directorios y archivos
   $wgUploadDirectory = "/var/www/html/images";
