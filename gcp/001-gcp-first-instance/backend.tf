terraform {
  backend "gcs" {
    credentials = "./credentials.json"
    bucket = "fateh-tf-test"
    prefix = "terraform/state"
  }
}