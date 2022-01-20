terraform {
  required_providers {
    discord = {
      source  = "aequasi/discord"
      version = "0.0.4"
    }
  }

  cloud {
    organization = "lucky3028"

    workspaces = {
      name = "Kagerou"
    }
  }
}

provider "discord" {
  token = var.discord_token
}
