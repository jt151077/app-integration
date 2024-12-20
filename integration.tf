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

resource "google_integrations_client" "int-client" {
  project  = local.project_id
  location = local.project_default_region

  depends_on = [
    google_project_service.gcp_services["integrations.googleapis.com"],
  ]
}

resource "google_integrations_auth_config" "config-rest-auth" {
  location     = local.project_default_region
  project      = local.project_id
  display_name = "rest-auth"
  
  decrypted_credential {
    credential_type = "AUTH_TOKEN"
    auth_token {
      token = "123"
      type  = "Bearer"
    }
  }
  depends_on = [google_integrations_client.int-client]
}

