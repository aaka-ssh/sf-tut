# Use an official MLflow runtime as a base image
FROM mlflow/mlflow:latest

# Set environment variables for Snowflake connection
ENV SNOWFLAKE_ACCOUNT = <your_snowflake_account>
ENV SNOWFLAKE_USER = <your_snowflake_username>
ENV SNOWFLAKE_PASSWORD = <your_snowflake_password>
ENV SNOWFLAKE_WAREHOUSE = <your_snowflake_warehouse>
ENV SNOWFLAKE_DATABASE = <your_snowflake_database>
ENV SNOWFLAKE_SCHEMA = <your_snowflake_schema>

# Install Snowpark Python library
RUN pip install snowflake-connector-python-spark

# Copy the MLflow project directory into the container
COPY . /mlflow_project

# Set the working directory to the MLflow project directory
WORKDIR /mlflow_project

# Define the volume for storing MLflow runs
VOLUME /mlflow_project/mlruns

# Expose the MLflow tracking server port
EXPOSE 5000

# Define the entrypoint script for starting the MLflow tracking server
ENTRYPOINT ["mlflow", "tracking", "server", "--host", "0.0.0.0", "--port", "5000"]
