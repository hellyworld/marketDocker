# Use the slim version of Python 3.10 as the base image
FROM python:3.10-slim

# Set metadata for the image
LABEL authors="helly"

# Set environment variables
ENV env_name=local
ENV debug=True

# Set the working directory inside the container
WORKDIR /django_docker

# Copy the requirements.txt file into the container and install dependencies
COPY requirements.txt /django_docker/
RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --upgrade pip \
    && pip install -r requirements.txt

# Copy the current directory contents into the container WORKDIR
COPY . /django_docker

# Expose the port Django will run on
EXPOSE 8080

# Run the entrypoint script
ENTRYPOINT ["python", "manage.py", "runserver", "0.0.0.0:8080"]