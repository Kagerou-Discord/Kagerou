data "discord_permission" "member" {
  view_channel  = "allow"
  send_messages = "allow"
}

data "discord_permission" "test" {
  view_channel  = "deny"
  send_messages = "deny"
}

resource "discord_role_everyone" "everyone" {
  server_id   = discord_server.server.id
  permissions = data.discord_permission.member.allow_bits
}

resource "discord_channel_permission" "community-update" {
  channel_id   = discord_text_channel.community-update.id
  type         = "role"
  overwrite_id = discord_role_everyone.everyone.id
  deny         = data.discord_permission.test.deny_bits
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
