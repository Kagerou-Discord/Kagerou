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

resource "discord_category_channel" "general" {
  name      = "general"
  server_id = discord_server.server.id
  position  = 0
}

resource "discord_text_channel" "general" {
  name      = "general"
  server_id = discord_server.server.id
  category  = discord_category_channel.general.id
}

data "discord_permission" "admin" {
  administrator = "allow"
}

resource "discord_role" "admin" {
  name        = "管理用ロール"
  server_id   = discord_server.server.id
  permissions = data.discord_permission.admin.allow_bits
  position    = 1
}

locals {
  admin_members = [
    "255951609174032385",
    "933006368443604992"
  ]
}

resource "discord_member_roles" "admin" {
  for_each  = toset(local.admin_members)
  user_id   = each.value
  server_id = discord_server.server.id
  role {
    role_id = discord_role.admin.id
  }
}
