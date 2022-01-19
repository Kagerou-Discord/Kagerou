terraform {
  required_providers {
    discord = {
      source  = "aequasi/discord"
      version = "0.0.4"
    }
  }
}

variable "discord_token" {
  type        = string
  description = "Token of the discord bot."
  sensitive   = true
}

provider "discord" {
  token = var.discord_token
}

resource "discord_server" "server" {
  name                          = "Kagerou"
  region                        = "japan"
  owner_id                      = "933006368443604992"
  default_message_notifications = 1
}
