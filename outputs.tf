#output "sa-storage-editor-access_key" {
#  value = yandex_iam_service_account_static_access_key.sa-storage-editor-static-key.access_key
#  sensitive = true
#}

#output "sa-storage-editor-secret_key" {
#  value = yandex_iam_service_account_static_access_key.sa-storage-editor-static-key.secret_key
#  sensitive = true
#}

output "external_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}

output "internal_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}
