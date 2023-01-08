terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox" # provider source
      version = "0.2.2-alpha.1" # provider version
    }
  }
}


resource "virtualbox_vm" "devops" { 
  count     = 3 # the number of virtual machines
  name      = format("devops-%02d", count.index + 1) # the name of the virtual machines
  image  = "https://app.vagrantup.com/shekeriev/boxes/debian-11/versions/0.2/providers/virtualbox.box" # link to the image
  cpus      = 1 # number of processors
  memory    = "512 mib" # the amount of RAM


  network_adapter {
    type           = "hostonly"  # network type
    device         = "IntelPro1000MTDesktop" # virtual hardware device model
    host_interface = "VirtualBox Host-Only Ethernet Adapter" # the name of the interface is hosted only for windows

  }
}

output "IPAddress" {
  value = element(virtualbox_vm.devops.*.network_adapter.0.ipv4_address, 1) # the IPv4 address assigned to the adapter for 1 machine
}

output "IPAddress_2" {
  value = element(virtualbox_vm.devops.*.network_adapter.0.ipv4_address, 2) # the IPv4 address assigned to the adapter for 2 machine
}

output "IPAddress_3" {
  value = element(virtualbox_vm.devops.*.network_adapter.0.ipv4_address, 3) # the IPv4 address assigned to the adapter for 3 machine
}
