
#!/usr/bin/env bash

# 1 – Load .env if it exists
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

# 2 – Fallback defaults
: "${MLFLOW_BACKEND_STORE_URI:=sqlite:///mlruns.db}"
: "${MLFLOW_ARTIFACT_ROOT:=./artifacts}"
: "${MLFLOW_PORT:=5000}"

# 3 – Start MLflow server
mlflow server \
  --backend-store-uri "${MLFLOW_BACKEND_STORE_URI}" \
  --default-artifact-root "${MLFLOW_ARTIFACT_ROOT}" \
  --host 0.0.0.0 \
  --port "${MLFLOW_PORT}"

