# Django Docker Setup

This project demonstrates how to containerize a Django application using Docker and Docker Compose.

## Requirements

- Docker
- Docker Compose

## Quick Start

Follow these steps to get the Django application up and running with Docker:

### 1. Build and Run Containers

Navigate to the directory containing the `docker-compose.yml` file and run the following command:

```shell
docker-compose up --build
```
### 2. Apply Migrations

Once the containers are up and running, open another terminal and run the following command to apply the migrations:


```shell
docker-compose exec web python manage.py migrate
```

### 3. Create Superuser

To access the Django admin panel, you need to create a superuser. Run the following command and follow the prompts to create a superuser account:

```shell
docker-compose exec web python manage.py createsuperuser
```


### 4. Access the Application

You can now access the Django application in your web browser at:

```bash
http://localhost:8080/
```

### 5. Access the Admin Panel

To access the Django admin panel, navigate to:

bash
```bash
http://localhost:8080/admin
```

Log in with the superuser credentials you created in the previous step.
Stopping the Containers

To stop the running containers, press Ctrl+C in the terminal where docker-compose up is running. Alternatively, you can run the following command in another terminal:


```shell
docker-compose down
```

