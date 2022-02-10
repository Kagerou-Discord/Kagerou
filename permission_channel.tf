locals {
  member_not_accessible = [
    discord_text_channel.newcomer.id,
    discord_text_channel.stock_r18.id,
    discord_text_channel.thumbs_down.id,
    discord_category_channel.management.id
  ]
  member_read_only = [
    discord_category_channel.announce.id,
    discord_category_channel.read_only.id
  ]
  member_read_and_write = [
    discord_category_channel.general.id
  ]
}

resource "discord_channel_permission" "member_not_accessible" {
  for_each     = toset(local.member_not_accessible)
  channel_id   = each.value
  type         = "role"
  overwrite_id = discord_role.member.id
  allow        = 0
  deny         = data.discord_permission.not_accessible.deny_bits
}

resource "discord_channel_permission" "member_read_only" {
  for_each     = toset(local.member_read_only)
  channel_id   = each.value
  type         = "role"
  overwrite_id = discord_role.member.id
  allow        = data.discord_permission.read_only.allow_bits
  deny         = data.discord_permission.read_only.deny_bits
}

resource "discord_channel_permission" "member_read_and_write" {
  for_each     = toset(local.member_read_and_write)
  channel_id   = each.value
  type         = "role"
  overwrite_id = discord_role.member.id
  allow        = data.discord_permission.read_and_write.allow_bits
  deny         = data.discord_permission.read_and_write.deny_bits
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

resource "discord_channel_permission" "stock_r18_safe_guard" {
  channel_id   = discord_text_channel.stock_r18.id
  type         = "role"
  overwrite_id = discord_role.safe_guard_nsfw.id
  allow        = data.discord_permission.read_only.allow_bits
  deny         = data.discord_permission.read_only.deny_bits
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
  for_each     = toset(local.member_read_and_write)
  channel_id   = each.value
  type         = "role"
  overwrite_id = discord_role.suspicious.id
  allow        = data.discord_permission.read_only.allow_bits
  deny         = data.discord_permission.read_only.deny_bits
}
