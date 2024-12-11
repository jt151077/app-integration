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


2. Build and deploy the webserver image in GKE, by issuing the following command at the root of the project:

```shell
$ ./deploy.sh
```

## Uninstall


1. Run the following at the root of your project

```shell 
$ ./uninstall.sh
```

> All resources will now be removed from your project
