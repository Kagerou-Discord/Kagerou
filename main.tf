terraform {
  required_providers {
    discord = {
      source  = "Chaotic-Logic/discord"
      version = "0.0.1"
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
