## Initialising MySQL with dummy data

_Using Docker Compose_

### Purpose

Needed an automated setup environment for a Next.js app, which requires a database to fetch data. But the Next.js app does not create / have any DDL statements. It can only update and get data. So I needed a way to have some dummy data and schema setup while testing the Next.js app without actually having to also setup the backend services (which have DDL statements) for MySQL intialisation.

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

We could check if the database is initialised by accessing the container's bash and ultimately the `mysql` service inside.

1. In a seperate terminal session (if you haven't specified `--detach` on `docker compose up`), execute this command to see all running containers.

```bash
docker ps

# If permission denied (in linux), try prefixing sudo
```

- Note down the CONTAINER_ID or simply the CONTAINER_NAME

2. Enter the bash terminal of the container

```bash
docker exec -it <CONTAINER_ID> bash
# Can also use CONTAINER_NAME instead
```

3. After entering the bash terminal of the container, we now enter into the MySQL CLI session.

```
mysql -u root -p
```

- It will now prompt you for a password, and we enter the password specified in our `docker-compose.yml`

4. Inside the MySQL session, we now put `show databases;` and other select queries to check if our data is populated.
