resource "discord_text_channel" "general" {
  name      = "general"
  server_id = discord_server.server.id
  category  = discord_category_channel.general.id
}

resource "discord_text_channel" "rule" {
  name      = "rule"
  server_id = discord_server.server.id
  category  = discord_category_channel.announce.id
}

resource "discord_text_channel" "news" {
  name      = "news"
  server_id = discord_server.server.id
  category  = discord_category_channel.announce.id
}
