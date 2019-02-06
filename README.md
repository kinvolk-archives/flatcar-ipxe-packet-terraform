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

## Error: Could not boot: Permission denied

```
PXEXT

net0: 0c:c4:7a:e5:45:0c using undionly on 0000:00:14.0 (open)
  [Link:up, TX:0 TXE:1 RX:0 RXE:0]
  [TXE: 1 x "Network unreachable (http://ipxe.org/28086011)"]
Configuring (net0 0c:c4:7a:e5:45:0c).................. ok
net0: 147.75.81.149/255.255.255.254 gw 147.75.81.148
net0: fe80::ec4:7aff:fee5:450c/64
Next server: 147.75.204.3
Filename: http://147.75.204.3/auto.ipxe
http://147.75.204.3/auto.ipxe... ok
auto.ipxe : 454 bytes [script]
Packet.net Baremetal - iPXE boot
http://147.75.204.3/phone-home...... ok
https://raw.githubusercontent.com/kinvolk/flatcar-ipxe-scripts/4fe69534f69013b96
81d8da7e61853407e4c1c59/packet.ipxe... ok
https://stable.release.flatcar-linux.net/amd64-usr/current/flatcar_production_px
e.vmlinuz... Permission denied (http://ipxe.org/022fe23c)
Could not boot: Permission denied (http://ipxe.org/022fe23c)
Could not boot image: Permission denied (http://ipxe.org/022fe23c)
No more network devices


Reboot and Select proper Boot device
or Insert Boot Media in selected Boot device and press a key
```
