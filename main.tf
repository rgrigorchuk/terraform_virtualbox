terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox" # джерело провайдера
      version = "0.2.2-alpha.1" # версія провайдера
    }
  }
}


resource "virtualbox_vm" "devops" { 
  count     = 3 # кількість віртуальних машин.
  name      = format("devops-%02d", count.index + 1) # ім'я віртуальних машин. 
  image  = "https://app.vagrantup.com/shekeriev/boxes/debian-11/versions/0.2/providers/virtualbox.box" # лінк на образ
  cpus      = 1 # кількість процессорів
  memory    = "512 mib" # кількість оперативної пам'яті


  network_adapter {
    type           = "hostonly"  # тип мережі
    device         = "IntelPro1000MTDesktop" # модель віртуального апаратного пристрою 
    host_interface = "VirtualBox Host-Only Ethernet Adapter" #  ім’я інтерфейсу хосту

  }
}

output "IPAddress" {
  value = element(virtualbox_vm.devops.*.network_adapter.0.ipv4_address, 1) # адреса IPv4, призначена адаптеру для 1 машини
}

output "IPAddress_2" {
  value = element(virtualbox_vm.devops.*.network_adapter.0.ipv4_address, 2) # адреса IPv4, призначена адаптеру для 2 машини.
}

output "IPAddress_3" {
  value = element(virtualbox_vm.devops.*.network_adapter.0.ipv4_address, 3) # адреса IPv4, призначена адаптеру для 3 машини.
}