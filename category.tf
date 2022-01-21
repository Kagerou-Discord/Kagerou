resource "discord_category_channel" "announce" {
  name      = "announcement"
  server_id = discord_server.server.id
  position  = 0
}

resource "discord_category_channel" "general" {
  name      = "general"
  server_id = discord_server.server.id
  position  = 2
}

resource "discord_category_channel" "read_only" {
  name      = "read-only"
  server_id = discord_server.server.id
  position  = 1
}

resource "discord_category_channel" "management" {
  name      = "management"
  server_id = discord_server.server.id
  position  = 3
}
