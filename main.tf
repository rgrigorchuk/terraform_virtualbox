terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox" # ������� ����������
      version = "0.2.2-alpha.1" # ����� ����������
    }
  }
}


resource "virtualbox_vm" "devops" { 
  count     = 3 # ������� ���������� �����.
  name      = format("devops-%02d", count.index + 1) # ��'� ���������� �����. 
  image  = "https://app.vagrantup.com/shekeriev/boxes/debian-11/versions/0.2/providers/virtualbox.box" # ��� �� �����
  cpus      = 1 # ������� ����������
  memory    = "512 mib" # ������� ���������� ���'��


  network_adapter {
    type           = "hostonly"  # ��� �����
    device         = "IntelPro1000MTDesktop" # ������ ����������� ���������� �������� 
    host_interface = "VirtualBox Host-Only Ethernet Adapter" #  ��� ���������� �����

  }
}

output "IPAddress" {
  value = element(virtualbox_vm.devops.*.network_adapter.0.ipv4_address, 1) # ������ IPv4, ���������� �������� ��� 1 ������
}

output "IPAddress_2" {
  value = element(virtualbox_vm.devops.*.network_adapter.0.ipv4_address, 2) # ������ IPv4, ���������� �������� ��� 2 ������.
}

output "IPAddress_3" {
  value = element(virtualbox_vm.devops.*.network_adapter.0.ipv4_address, 3) # ������ IPv4, ���������� �������� ��� 3 ������.
}