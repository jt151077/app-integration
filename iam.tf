/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


#permissions for Build service account
resource "google_project_iam_member" "logging-logWriter" {
  depends_on = [
    google_project_service.gcp_services
  ]

  project = local.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${local.project_number}-compute@developer.gserviceaccount.com"
}


resource "google_project_iam_member" "storage-admin" {
  depends_on = [
    google_project_service.gcp_services
  ]

  project = local.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${local.project_number}-compute@developer.gserviceaccount.com"
}


resource "google_project_iam_member" "apigeeIntegrationAdminRole" {
  depends_on = [
    google_project_service.gcp_services
  ]

  project = local.project_id
  role    = "roles/integrations.apigeeIntegrationAdminRole"
  member  = "serviceAccount:${local.project_number}-compute@developer.gserviceaccount.com"
}


resource "google_project_iam_member" "pubsub-admin" {
  depends_on = [
    google_project_service.gcp_services
  ]

  project = local.project_id
  role    = "roles/pubsub.admin"
  member  = "serviceAccount:${local.project_number}-compute@developer.gserviceaccount.com"
}

# pour le pub/sub trigger
resource "google_service_account" "app-int-pub-sub-sa" {
  depends_on = [
    google_project_service.gcp_services
  ]

  project      = local.project_id
  account_id   = "app-int-pub-sub-sa"
  display_name = "Service Account for app-int-pub-sub-sa"
}


resource "google_project_iam_member" "integrations-integrationInvoker" {
  depends_on = [
    google_project_service.gcp_services
  ]

  project = local.project_id
  role    = "roles/integrations.integrationInvoker"
  member  = "serviceAccount:${google_service_account.app-int-pub-sub-sa.email}"
  
}