# Instructions

1. Run `terraform init` to install all modules required by this configuration.
2. Run `terraform plan -var-file="env/development.tfvars"` to output the execution plan.
3. Run `terraform apply -var-file="env/development.tfvars` to create S3 bucket.

# Quick Sketch

I'm going to assume Terraform modules are published to a private Terraform Registry, similar to how NPM javascript packages are published.

```mermaid
sequenceDiagram
    actor Dev as Developer
    participant TF as Private TF Registry
    participant AWS
    Dev ->>+ TF: download module
    TF -->>- Dev: tf files
    Dev -->> Dev: modify .tfvars file
    Dev ->>+ AWS: terraform apply
    AWS -->>- Dev: results
```

# Bonus

I'm by no means an expert in Terraform, but my initial research points me to the implementation of [Sentinel Policies](https://developer.hashicorp.com/terraform/cloud-docs/policy-enforcement/sentinel).
Also found some [Sentinel Policies for AWS](https://github.com/hashicorp/terraform-guides/tree/master/governance/first-generation/aws)

My guess is that running Terraform will look like this:

```mermaid
flowchart TD
    A[plan] -->|1| B[Sentinel]
    B --> |2. get IAM role arns| C(list of allowed IAM roles) --> B
    B ---> |3| D{check user's IAM role}
    D --> |4a. valid IAM  role| E[apply]
    D --> |4b. invalid IAM  role| F[end]
```