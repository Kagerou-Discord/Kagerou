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
