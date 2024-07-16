
### Set AWS Credentials ###
sh set_aws_creds.sh

### Spin up the cluster and link it to kubectl ###
sh deploy_cluster.sh

### Create a database ###
sh deploy_database.sh

### Deploy application ###
sh deploy_application.sh

