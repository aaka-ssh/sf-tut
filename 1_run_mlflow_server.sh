#!/bin/bash
mlflow server \
    --backend-store-uri sqlite:///mlflow.db \
    --default-artifact-root ./artifacts \
    --host $MLFLOW_SERVER_HOST \
    --port $MLFLOW_SERVER_PORT
