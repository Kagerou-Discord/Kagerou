resource "discord_text_channel" "general" {
  name      = "general"
  server_id = discord_server.server.id
  category  = discord_category_channel.general.id
}

resource "discord_text_channel" "community-update" {
  name      = "community-update"
  server_id = discord_server.server.id
  category  = discord_category_channel.management.id
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

resource "discord_text_channel" "system" {
  name      = "system-log"
  server_id = discord_server.server.id
  category  = discord_category_channel.read_only.id
}

resource "discord_text_channel" "stock" {
  name      = "stock"
  server_id = discord_server.server.id
  category  = discord_category_channel.read_only.id
}

resource "discord_text_channel" "stock_r18" {
  name      = "stock-r18"
  server_id = discord_server.server.id
  category  = discord_category_channel.read_only.id
  nsfw      = true
}

resource "discord_text_channel" "admin" {
  name      = "admin"
  server_id = discord_server.server.id
  category  = discord_category_channel.management.id
}
