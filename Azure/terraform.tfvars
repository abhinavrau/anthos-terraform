gcp_project_id = "argolis-arau"
#add up to 10 GCP Ids for cluster admin via connect gateway
admin_users = ["ce-arau@arau.altostrat.com"]
name_prefix = "gke-azure-apigee"
/* supported instance types
https://cloud.google.com/anthos/clusters/docs/multi-cloud/azure/reference/supported-vms
*/
control_plane_instance_type = "Standard_DS2_v2"
node_pool_instance_type     = "Standard_DS4_v2"
cluster_version             = "1.23.8-gke.1700"
/*
Use 'gcloud container azure get-server-config --location [gcp-region]' to see K8s versions/ region availability --
https://cloud.google.com/anthos/clusters/docs/multi-cloud/azure/reference/supported-regions
*/
gcp_location = "us-east4"
azure_region = "eastus"
