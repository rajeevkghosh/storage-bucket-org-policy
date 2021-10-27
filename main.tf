provider "google" {
 access_token = var.access_token
 project = "airline1-sabre-wolverine"
 #credentials = file("../key.json")
}

data "google_project_organization_policy" "policy" {
  project    = "airline1-sabre-wolverine"
  constraint = "constraints/storage.publicAccessPrevention"
}

resource "google_storage_bucket" "rockstar" {
  name          = "rockstar-bucket"
  location      = "US"
  force_destroy = true
  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = 3
     
    }
    action {
      type = "Delete"
    }

  }

}


resource "google_storage_bucket" "hellobucket" {
  name          = "hello-bucket-air"
  location      = "US"
  force_destroy = true
  
  lifecycle_rule {
    condition {
      age = 3

    }
    action {
      type = "Delete"
    }

  }

}

