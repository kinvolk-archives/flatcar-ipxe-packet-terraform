provider "packet" {}

resource "packet_device" "ipxe-test" {
  count            = 1
  hostname         = "ipxe-test"
  plan             = "baremetal_0"
  facility         = "ams1"
  operating_system = "custom_ipxe"
  billing_cycle    = "hourly"
  project_id       = "${var.project_id}"
  # Using https works only sometimes:
  ipxe_script_url  = "https://raw.githubusercontent.com/kinvolk/flatcar-ipxe-scripts/4fe69534f69013b9681d8da7e61853407e4c1c59/packet.ipxe"
  # Not using https in the ipxe base-url always works:
  # ipxe_script_url  = "https://raw.githubusercontent.com/kinvolk/flatcar-ipxe-scripts/106386d75285b81488694f53bef441d6759a79fe/packet.ipxe"
  always_pxe       = "false"
  user_data        = "${element(data.ct_config.ignition-config.*.rendered, count.index)}"
}

data "ct_config" "ignition-config" {
  count   = "1"
  content = "${element(data.template_file.controller-configs.*.rendered, count.index)}"
}

data "template_file" "controller-configs" {
  count    = "1"
  template = "${file("${path.module}/cl/demo.yaml.tmpl")}"

  vars = {
    ssh_keys = "${jsonencode("${var.ssh_keys}")}"
  }
}
