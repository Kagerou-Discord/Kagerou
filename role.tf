data "discord_permission" "not_accessible" {
  view_channel = "deny"
}

data "discord_permission" "read-only" {
  view_channel  = "allow"
  send_messages = "deny"
}

data "discord_permission" "read-and-write" {
  allow_extends = data.discord_permission.read-only.allow_bits
  send_messages = "allow"
}

resource "discord_role_everyone" "everyone" {
  server_id   = discord_server.server.id
  permissions = data.discord_permission.not_accessible.deny_bits
}

resource "discord_channel_permission" "community-update" {
  channel_id   = discord_text_channel.community-update.id
  type         = "role"
  overwrite_id = discord_role.not_accessible.id
}

resource "discord_role" "member" {
  name        = "メンバー"
  server_id   = discord_server.server.id
  permissions = data.discord_permission.read-and-write.allow_bits
  position    = 0
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
