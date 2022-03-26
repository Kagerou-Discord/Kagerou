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

# spam-reporterのロール
data "discord_role" "spam_reporter" {
  server_id = local.server_id
  role_id   = "939896732047769611"
}

resource "discord_role" "safe_guard_nsfw" {
  name        = "しんぴのまもり（NSFW）"
  server_id   = local.server_id
  permissions = 0
  position    = 4
}

resource "discord_role" "safe_guard" {
  name        = "しんぴのまもり"
  server_id   = local.server_id
  permissions = 0
  position    = 3
}

resource "discord_role" "suspicious" {
  name        = "suspicious"
  server_id   = local.server_id
  permissions = 0
  position    = 2
  # https://www.colordic.org/colorsample/8002
  color = 8274750
}

resource "discord_role" "member" {
  name        = "メンバー"
  server_id   = local.server_id
  permissions = data.discord_permission.everyone.allow_bits
  position    = 1
}
