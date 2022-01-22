resource "discord_category_channel" "announce" {
  name      = "announcement"
  server_id = local.server_id
  position  = 0
}

resource "discord_category_channel" "general" {
  name      = "general"
  server_id = local.server_id
  position  = 1
}

resource "discord_category_channel" "read_only" {
  name      = "read-only"
  server_id = local.server_id
  position  = 2
}

resource "discord_category_channel" "management" {
  name      = "management"
  server_id = local.server_id
  position  = 3
}
