## Overview
This repo contains the setup for the Tindoori PostgreSQL database and the Flyway setup migrations. The database runs in Docker. The docker-compose initializes the database and runs the Flyway scripts against it.

## Getting Started

### Environment Variables

You'll need the following environment variables:
`POSTGRES_DB` - name of the database
`POSTGRES_USER` - name of the intialized user. PostgreSQL provisions the user and Flyway uses the user to run the migrations.
`POSTGRES_PASSWORD` - password of the database user

### Running

Use the following command to run the database and run the Flyway migrations.
```
./run_in_docker.sh
```

Press Ctrl+C when you no longer need db to run. The database instance will be saved locally between runs.

Use the following command to remove the local instance:
```
./destroy_docker_instance.sh
```

## Used Materials

Credit to tomaszbartoszewski. This proejct was initialized by forking [this repo](https://github.com/tomaszbartoszewski/postgresql-docker).