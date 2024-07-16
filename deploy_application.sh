#!/bin/bash
# # Update the local package index with the latest packages from the repositories
apt update -y

# Install a couple of packages to successfully install postgresql server locally
apt install -y build-essential libpq-dev

# Update python modules to successfully build the required modules
python -m pip install --upgrade pip setuptools wheel

sudo ln -s /usr/bin/python3.8 /usr/bin/python

python -m pip install -r analytics/requirements.txt

kubectl port-forward service/postgresql-service 5433:5432 &

# Export the password. 
export POSTGRES_PASSWORD=mypassword

export DB_USERNAME=myuser
export DB_PASSWORD=${POSTGRES_PASSWORD}
export DB_HOST=127.0.0.1
export DB_PORT=5433
export DB_NAME=mydatabase


python analytics/app.py