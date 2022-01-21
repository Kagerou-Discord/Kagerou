data "discord_permission" "not_accessible" {
  view_channel = "deny"
}

data "discord_permission" "read_only" {
  view_channel         = "allow"
  send_messages        = "deny"
  read_message_history = "allow"
}

data "discord_permission" "read_and_write" {
  allow_extends = data.discord_permission.read_only.allow_bits
  send_messages = "allow"
}

resource "discord_role_everyone" "everyone" {
  server_id   = discord_server.server.id
  permissions = 0
}

resource "discord_channel_permission" "announce" {
  channel_id   = discord_category_channel.announce.id
  type         = "role"
  overwrite_id = discord_role.member.id
  deny         = data.discord_permission.read_only.deny_bits
}

resource "discord_channel_permission" "read_only" {
  channel_id   = discord_category_channel.read_only.id
  type         = "role"
  overwrite_id = discord_role.member.id
  allow        = 0
  deny         = data.discord_permission.read_only.deny_bits
}

resource "discord_channel_permission" "thumbs_down_member" {
  channel_id   = discord_text_channel.thumbs_down.id
  type         = "role"
  overwrite_id = discord_role.member.id
  allow        = 0
  deny         = data.discord_permission.not_accessible.deny_bits
}

resource "discord_channel_permission" "thumbs_down_safe_guard" {
  channel_id   = discord_text_channel.thumbs_down.id
  type         = "role"
  overwrite_id = discord_role.member.id
  allow        = 0
  deny         = data.discord_permission.read_only.deny_bits
}

resource "discord_channel_permission" "management" {
  channel_id   = discord_category_channel.management.id
  type         = "role"
  overwrite_id = discord_role_everyone.everyone.id
  allow        = 0
  deny         = data.discord_permission.not_accessible.deny_bits
}

resource "discord_role" "safe_guard" {
  name        = "しんぴのまもり"
  server_id   = discord_server.server.id
  permissions = data.discord_permission.read_and_write.allow_bits
  position    = 1
}

resource "discord_role" "member" {
  name        = "メンバー"
  server_id   = discord_server.server.id
  permissions = data.discord_permission.read_and_write.allow_bits
  position    = 2
}

data "discord_permission" "admin" {
  administrator = "allow"
}

resource "discord_role" "admin" {
  name        = "管理用ロール"
  server_id   = discord_server.server.id
  permissions = data.discord_permission.admin.allow_bits
  position    = 0
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
