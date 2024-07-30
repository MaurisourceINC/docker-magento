terraform {
  cloud {
    organization = "Maurisource"

    workspaces {
      name = "maurice-docker"
    }
  }
}