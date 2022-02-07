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

data "discord_permission" "admin" {
  allow_extends = data.discord_permission.read_and_write.allow_bits
  administrator = "allow"
}

resource "discord_role_everyone" "everyone" {
  server_id   = local.server_id
  permissions = 0
}

resource "discord_channel_permission" "newcomer" {
  channel_id   = discord_text_channel.newcomer.id
  type         = "role"
  overwrite_id = discord_role_everyone.everyone.id
  allow        = data.discord_permission.read_only.allow_bits
  deny         = data.discord_permission.read_only.deny_bits
}

resource "discord_channel_permission" "newcomer_member" {
  channel_id   = discord_text_channel.newcomer.id
  type         = "role"
  overwrite_id = discord_role.member.id
  allow        = 0
  deny         = data.discord_permission.not_accessible.deny_bits
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

resource "discord_channel_permission" "stock_r18_member" {
  channel_id   = discord_text_channel.stock_r18.id
  type         = "role"
  overwrite_id = discord_role.member.id
  allow        = 0
  deny         = data.discord_permission.not_accessible.deny_bits
}

resource "discord_channel_permission" "stock_r18_safe_guard" {
  channel_id   = discord_text_channel.stock_r18.id
  type         = "role"
  overwrite_id = discord_role.safe_guard_nsfw.id
  allow        = data.discord_permission.read_only.allow_bits
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
  overwrite_id = discord_role.safe_guard.id
  allow        = data.discord_permission.read_only.allow_bits
  deny         = data.discord_permission.read_only.deny_bits
}

resource "discord_channel_permission" "management" {
  channel_id   = discord_category_channel.management.id
  type         = "role"
  overwrite_id = discord_role_everyone.everyone.id
  allow        = 0
  deny         = data.discord_permission.not_accessible.deny_bits
}

# suspiciousはすべてのチャンネルでread-only
resource "discord_channel_permission" "suspicious" {
  channel_id   = discord_category_channel.general.id
  type         = "role"
  overwrite_id = discord_role.member.id
  deny         = data.discord_permission.read_only.deny_bits
}

resource "discord_role" "admin" {
  name        = "管理用ロール"
  server_id   = local.server_id
  permissions = data.discord_permission.admin.allow_bits
  position    = 7
}

# carl-botのロール
data "discord_role" "carl_bot" {
  server_id = local.server_id
  role_id   = "934643172942942269"
}

# TODO: 権限をちゃんとする
# spam-reporterのロール
data "discord_role" "spam_reporter" {
  server_id = local.server_id
  role_id   = "939896732047769611"
}

resource "discord_role" "safe_guard_nsfw" {
  name        = "しんぴのまもり（NSFW）"
  server_id   = local.server_id
  permissions = data.discord_permission.read_and_write.allow_bits
  position    = 4
}

resource "discord_role" "safe_guard" {
  name        = "しんぴのまもり"
  server_id   = local.server_id
  permissions = data.discord_permission.read_and_write.allow_bits
  position    = 3
}

resource "discord_role" "suspicious" {
  name        = "suspicious"
  server_id   = local.server_id
  permissions = data.discord_permission.read_only.allow_bits
  position    = 2
}

resource "discord_role" "member" {
  name        = "メンバー"
  server_id   = local.server_id
  permissions = data.discord_permission.read_and_write.allow_bits
  position    = 1
}

locals {
  admin_members = [
    "255951609174032385",
    "933006368443604992"
  ]

  members = [
    "889808240454561853"
  ]
}

resource "discord_member_roles" "admin" {
  for_each  = toset(local.admin_members)
  user_id   = each.value
  server_id = local.server_id
  role {
    role_id = discord_role.admin.id
  }
}

resource "discord_member_roles" "member" {
  for_each  = toset(local.members)
  user_id   = each.value
  server_id = local.server_id
  role {
    role_id = discord_role.member.id
  }
}
