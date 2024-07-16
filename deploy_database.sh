kubectl get namespace # Ensure connection to cluster
# Apply yaml configs
kubectl apply -f pvc.yaml
kubectl apply -f pv.yaml
kubectl apply -f postgresql-deployment.yaml
kubectl apply -f postgresql-service.yaml
kubectl port-forward service/postgresql-service 5433:5432 &

# Run seed files
apt update -y
apt install -y postgresql postgresql-contrib
export DB_PASSWORD=mypassword

# Define the target directory
directory="db"

# Check if the target is not a directory
if [ ! -d "$directory" ]; then
  exit 1
fi

# Loop through files in the target directory
for file in "$directory"/*; do
  if [ -f "$file" ]; then
    PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < $file
  fi
done
