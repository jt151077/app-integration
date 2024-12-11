# Application Integration in GCP


## Setup

1. Find out your GCP project's id and number from the dashboard in the cloud console, and update the following variables in the `terraform.tfvars.json` file. Replace `YOUR_PROJECT_NMR`, `YOUR_PROJECT_ID` and `YOUR_PROJECT_REGION` with the correct values. 


```shell
{
    "project_id": "YOUR_PROJECT_ID",
    "project_nmr": YOUR_PROJECT_NMR,
    "project_default_region": "YOUR_PROJECT_REGION"
}
```


## Install

1. Run the following command at the root of the folder:
```shell 
$ ./install.sh
$ terraform init
$ terraform plan
$ terraform apply
```


2. Build and deploy the integration to create a new version:

```shell
$ gcloud builds submit --config=cloudbuild.yaml --project=YOUR_PROJECT_ID --region=YOUR_PROJECT_REGION --substitutions=_LOCATION=YOUR_PROJECT_REGION
```

## Uninstall


1. Run the following at the root of your project

```shell 
$ terraform destroy
```

> All resources will now be removed from your project
