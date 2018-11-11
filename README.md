# WPSD: WordPress httpS Docker

This package includes:

- "nginx" as webserver
- "let's encrypt" for using free https certificates
- "php" for hosting services
- "wordpress" as the execution unit
- "mysql/maria" as database storage

All using docker (with docker-compose for convenience) to capsule services from your host system.


Before running make sure that the bash script is ready for execution:
   
    chmod +x start.sh
    chmod +x cleanup.sh
    chmod +x stop.sh


Also make sure that docker (and docker-compose) is installed on your maschine:

    apt-get install docker.io docker-compose


Start all Services:

    ./start.sh


Temporarily Stop all Services:

    ./stop.sh


Cleanup all Services (files are deleted, be carefullyw with it!):

    ./cleanup.sh