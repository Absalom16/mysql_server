#!/bin/sh
set -e

# Start MySQL in background
docker-entrypoint.sh mysqld &

# Wait for MySQL to be ready
echo "Waiting for MySQL..."
until mysqladmin ping -h 127.0.0.1 --silent; do
  sleep 1
done

echo "MySQL ready"

# Start HTTP server (foreground)
python3 /health.py
