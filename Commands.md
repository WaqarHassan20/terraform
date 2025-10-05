# 🚀 Terraform Commands Reference

A comprehensive guide to essential Terraform commands for infrastructure management.

---

## 🔧 Initialization & Validation

### `terraform init`
**Purpose:** Initializes the working directory  
**Details:** Downloads providers, sets up backends, prepares modules. Must be run once when starting a new project.

### `terraform validate`
**Purpose:** Validates that the configuration files are syntactically correct  
**Details:** Good for catching syntax errors before planning.

### `terraform fmt`
**Purpose:** Automatically formats Terraform files (.tf) into a standard style  
**Details:** Helps maintain consistent code style across teams.

### `terraform fmt -check`
**Purpose:** Checks if formatting is needed without actually changing files  
**Details:** Useful in CI/CD pipelines.

### `terraform providers`
**Purpose:** Lists all the providers required and where they come from  
**Details:** Good for verifying provider versions.

### `terraform graph`
**Purpose:** Creates a DOT format graph of the dependency tree  
**Details:** Can be visualized using graph tools.

---

## 📋 Planning & Applying

### `terraform plan`
**Purpose:** Shows what Terraform will do without applying  
**Details:** Helps preview infrastructure changes safely.

### `terraform plan -out=infra.out`
**Purpose:** Saves the plan to a file (infra.out)  
**Details:** Useful for ensuring the exact plan is applied later.

### `terraform plan -var-file=stage.tfvars -out=infra.out`
**Purpose:** Generates a plan using a variable file (stage.tfvars)  
**Details:** Allows environment-specific configurations.

### `terraform plan -generate-config-out=generated.tf`
**Purpose:** Generates configuration for existing infrastructure  
**Details:** Mainly used after `terraform import`.

### `terraform apply`
**Purpose:** Applies the planned changes directly  
**Details:** Creates, updates, or deletes resources.

### `terraform apply infra.out`
**Purpose:** Applies a previously saved plan (infra.out)  
**Details:** Ensures no changes between plan and apply steps.

### `terraform apply -var-file=stage.tfvars infra.out`
**Purpose:** Applies with specific variable file + saved plan  
**Details:** Useful for environment-based deployments.

### `terraform destroy`
**Purpose:** Destroys all managed infrastructure  
**Details:** ⚠️ **Use with caution.**

---

## 🌐 Workspaces (Multi-Environment Support)

### `terraform workspace show`
**Purpose:** Shows the current active workspace  
**Details:** Default workspace is "default".

### `terraform workspace list`
**Purpose:** Lists all available workspaces  

### `terraform workspace select stage`
**Purpose:** Switches to an existing workspace named "stage"  

### `terraform workspace new prod`
**Purpose:** Creates a new workspace called "prod"  

---

## 📊 State Management

### `terraform state list`
**Purpose:** Lists all resources tracked in Terraform state  

### `terraform state show digitalocean_droplet.test-droplet`
**Purpose:** Shows detailed state info for a specific resource  

### `terraform state rm digitalocean_droplet.test-droplet`
**Purpose:** Removes a resource from Terraform state (but does NOT delete in cloud)  
**Details:** Useful when managing outside of Terraform.

### `terraform import digitalocean_droplet.test-droplet 522181279`
**Purpose:** Imports an existing resource (DigitalOcean droplet with ID 522181279) into Terraform state  
**Details:** Lets Terraform manage pre-existing infra.

### `terraform show`
**Purpose:** Displays human-readable information about the state or a saved plan  

### `terraform output`
**Purpose:** Displays the values defined in "output" blocks  
**Details:** Useful to get credentials, IPs, or connection strings.

---

## 🛠️ Utilities

### `tree`
**Purpose:** Displays a directory structure in tree format  
**Details:** Not a Terraform command — a Linux utility. Helpful for visualizing project files.

---

## 📝 Quick Command Reference

```bash
# Planning and Config Generation
terraform plan -generate-config-out=generated.tf

# Import Existing Resources
terraform import digitalocean_droplet.test-droplet 522181279

# Basic Workflow
terraform init
terraform plan
terraform plan -out=infra.out
terraform apply infra.out
terraform destroy

# Workspace Management
terraform workspace show
terraform workspace select stage
terraform workspace new prod

# Output and Information
terraform output
terraform show

# Environment-Specific Deployments
terraform apply -var-file=stage.tfvars infra.out
terraform plan -var-file=stage.tfvars -out=infra.out

# Directory Structure Visualization
tree
```