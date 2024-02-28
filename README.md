## Initialising MySQL with dummy data

_Using Docker Compose_

### Purpose

### Setting up locally

1. Ensure you have installed Docker and [Docker Compose](https://docs.docker.com/compose/install/) in your respective OS.

2. Note that in the `docker-compose.yml`, in the `environment:` section, we are actually **setting** the `root` user's password for MYSQL. The MySQL image will use the following environment variables when initialising. More details in `docker-compose.yml`.

- `MYSQL_DATABASE` (database schema name)
- `MYSQL_ROOT_PASSWORD`

3. Run this command to spin up the container.

```bash
# --build flag to explicitly rebuild and restart the containers with the latest changes.

docker compose up --build
```

4. Wait for the following output message to appear, so we know the database is initialised and the service is running >> `[Server] /usr/sbin/mysqld: ready for connections.`

#### Additional checks

We could check if the database is initialised by accessing the container's bash and ultimate the `mysql` service inside.
