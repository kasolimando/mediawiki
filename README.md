# MediaWiki Docker Compose

This repository provides everything you need to run MediaWiki in a Docker container. It includes a Dockerfile to build the MediaWiki image, an entrypoint script to start the MediaWiki server, and a docker-compose file to configure and run the containers.

## Requisitos previos

Asegúrate de tener los siguientes requisitos previos instalados en tu máquina:

- Docker: [Instrucciones de instalación](https://docs.docker.com/install/)
- Docker Compose: [Instrucciones de instalación](https://docs.docker.com/compose/install/)

## Configuración
Before running the application, some configuration is required. Follow these steps:

Open the LocalSettings.php file located in the /var/www/html/ directory.
Update the configurations as per your needs. Ensure you provide the correct database information, directories, and MediaWiki files.

   // Database Configuration
   
   $wgDBname = "mediawiki";
   $wgDBuser = "root";
   $wgDBpassword = "password";

   // Directory and File Configuration
   $wgUploadDirectory = "/var/www/html/images";
