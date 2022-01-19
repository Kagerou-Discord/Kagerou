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

resource "discord_server" "etoile" {
  name                          = "Kagerou"
  region                        = "japan"
  owner_id                      = "933006368443604992"
  default_message_notifications = 1
}

resource "discord_category_channel" "general" {
  name      = "general"
  server_id = discord_server.etoile.id
  position  = 0
}

resource "discord_text_channel" "general" {
  name      = "general"
  server_id = discord_server.etoile.id
  category  = discord_category_channel.general.id
}

resource "discord_invite" "invite_to_general" {
  channel_id = discord_text_channel.general.id
  max_age    = 0
}
