#!/bin/bash

# Get environment from event.json
ENVIRONMENT=$(cat event.json | grep -o '"environment": "[^"]*"' | cut -d'"' -f4)
ROLLBACK_TAG=$(cat event.json | grep -o '"rollback_tag": "[^"]*"' | cut -d'"' -f4)

echo "Environment: $ENVIRONMENT"
echo "Rollback Tag: $ROLLBACK_TAG"

# Set default values
DB_URL="jdbc:postgresql://localhost:5432/testdb"
DB_USER="admin"
DB_PASSWORD="admin"

# Override based on environment
if [ "$ENVIRONMENT" == "local" ]; then
  DB_URL="jdbc:postgresql://localhost:5433/postgres"
  DB_USER="admin"
  DB_PASSWORD="admin"
elif [ "$ENVIRONMENT" == "dev" ]; then
  # Use dev environment settings if different
  DB_URL="jdbc:postgresql://localhost:5432/testdb"
elif [ "$ENVIRONMENT" == "stage" ]; then
  # Use stage environment settings if different
  DB_URL="jdbc:postgresql://localhost:5432/testdb"
fi

echo "Using database URL: $DB_URL"
echo "Using database user: $DB_USER"

# Run act with explicit parameters for liquibase
act --job rollback \
  --eventpath event.json \
  --container-architecture linux/amd64 \
  -P ubuntu-latest=catthehacker/ubuntu:act-latest \
  --env ROLLBACK_TAG="$ROLLBACK_TAG"

  #to update the database
  # mvn liquibase:update -Dliquibase.url=jdbc:postgresql://localhost:5432/testdb -Dliquibase.username=admin -Dliquibase.password=admin -Dliquibase.changeLogFile=src/main/resources/db/changelog/changelog-master.yaml -Dliquibase.driver=org.postgresql.Driver
