## Demo terraform code to show how to boot Flatcar on Packet via iPXE

Make sure you have https://github.com/coreos/terraform-provider-ct
installed.

Create a file `terraform.tfvars` and define the following variables:

```toml
project_id = ""
ssh_keys = [
  "ssh-rsa ...",
]
```

Run terraform:

```
export PACKET_AUTH_TOKEN=""
terraform init
terraform apply
```

Your server should be reachable via ssh shortly after:

```
ssh core@...
```
