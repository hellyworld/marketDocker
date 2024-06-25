# Use the slim version of Python 3.10 as the base image
FROM python:3.10-slim

# Set metadata for the image
LABEL authors="helly"

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV env_name=local
ENV debug=True

# Set the working directory inside the container
WORKDIR /django_docker

# Copy the requirements.txt file into the container
COPY requirements.txt /django_docker/

# Install system dependencies and MySQL client
RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy the current directory contents into the container WORKDIR
COPY . /django_docker

# Print contents of requirements.txt (for debugging)
RUN cat /django_docker/requirements.txt
