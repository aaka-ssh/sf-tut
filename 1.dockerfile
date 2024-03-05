# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Install required dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
 && rm -rf /var/lib/apt/lists/*

# Install MLflow and Snowpark dependencies
RUN pip install mlflow snowflake-connector-python[pandas]

# Expose the MLflow UI port
EXPOSE 5000

# Set environment variables for MLflow
ENV MLFLOW_HOME /app/mlflow
ENV MLFLOW_SERVER_HOST 0.0.0.0
ENV MLFLOW_SERVER_PORT 5000

# Copy the MLflow server entrypoint script into the container
COPY run_mlflow_server.sh /app/run_mlflow_server.sh

# Set execute permissions on the entrypoint script
RUN chmod +x /app/run_mlflow_server.sh

# Run MLflow server
CMD ["/app/run_mlflow_server.sh"]
