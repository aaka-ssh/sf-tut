# Use an official MLflow runtime as a parent image
FROM mlflow/mlflow:1.20.0

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install Snowflake Connector for Python
RUN pip install snowflake-connector-python

# Install Snowpark Python package
RUN pip install snowpark-python

# Install MLflow tracking server and UI
RUN pip install mlflow[server]

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Run MLflow tracking server on port 5000
CMD ["mlflow", "server", "--host", "0.0.0.0", "--port", "5000"]
