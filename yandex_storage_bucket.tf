#resource "yandex_iam_service_account" "sa-storage-editor" {
#  folder_id = var.YC_FOLDER_ID
#  name      = var.YC_SA_NAME
#}

#resource "yandex_resourcemanager_folder_iam_member" "sa-storage-editor" {
#  folder_id = var.YC_FOLDER_ID
#  role      = "storage.editor"
#  member    = "serviceAccount:${yandex_iam_service_account.sa-storage-editor.id}"
#}

#resource "yandex_iam_service_account_static_access_key" "sa-storage-editor-static-key" {
#  service_account_id = yandex_iam_service_account.sa-storage-editor.id
#  description        = "Static access key for object storage"
#}

#resource "yandex_storage_bucket" "state" {
#  bucket     = var.YC_STATE_BUCKET_NAME
#  access_key = yandex_iam_service_account_static_access_key.sa-storage-editor-static-key.access_key
#  secret_key = yandex_iam_service_account_static_access_key.sa-storage-editor-static-key.secret_key
#}
