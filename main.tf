terraform {
  required_providers {
    discord = {
      source  = "Lucky3028/discord"
      version = "1.0.７"
    }
  }

  cloud {
    organization = "lucky3028"

    workspaces {
      name = "Kagerou"
    }
  }
}

provider "discord" {
  token = var.discord_token
}
