# WPSD: Wordpress Https 

This package includes:

- "nginx" as webserver
- "let's encrypt" for using free https certificates
- "php" for hosting services
- "wordpress" as the execution unit
- "mysql/maria" as database storage

All using docker (with docker-compose for convenience) to capsule services from your host system.


Before running make sure that the bash script is ready for execution:
   
    chmod +x wpsd.sh


Also make sure that docker (and docker-compose) is installed on your maschine:

     apt-get install docker.io docker-compose