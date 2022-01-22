resource "discord_text_channel" "newcomer" {
  name      = "for-newcomers"
  server_id = discord_server.server.id
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

resource "discord_text_channel" "about" {
  name      = "about"
  server_id = discord_server.server.id
  category  = discord_category_channel.announce.id
}

resource "discord_text_channel" "general" {
  name      = "general"
  server_id = discord_server.server.id
  category  = discord_category_channel.general.id
}

resource "discord_text_channel" "oshi" {
  name      = "推し"
  server_id = discord_server.server.id
  category  = discord_category_channel.general.id
}

resource "discord_text_channel" "neta_photo" {
  name      = "ネタ画像"
  server_id = discord_server.server.id
  category  = discord_category_channel.general.id
}

resource "discord_text_channel" "idea" {
  name      = "idea"
  server_id = discord_server.server.id
  category  = discord_category_channel.general.id
}

resource "discord_text_channel" "role" {
  name      = "role"
  server_id = discord_server.server.id
  category  = discord_category_channel.read_only.id
  position  = 0
}

resource "discord_text_channel" "system" {
  name      = "system-log"
  server_id = discord_server.server.id
  category  = discord_category_channel.read_only.id
  position  = 1
}

resource "discord_text_channel" "stock" {
  name      = "stock"
  server_id = discord_server.server.id
  category  = discord_category_channel.read_only.id
  position  = 2
}

resource "discord_text_channel" "stock_r18" {
  name                     = "stock-r18"
  server_id                = discord_server.server.id
  category                 = discord_category_channel.read_only.id
  nsfw                     = true
  position                 = 3
  sync_perms_with_category = false
}

resource "discord_text_channel" "thumbs_down" {
  name                     = "👎"
  server_id                = discord_server.server.id
  category                 = discord_category_channel.read_only.id
  nsfw                     = true
  position                 = 4
  sync_perms_with_category = false
}

resource "discord_text_channel" "admin_announce" {
  name      = "announce-admin"
  server_id = discord_server.server.id
  category  = discord_category_channel.management.id
  position  = 0
}

resource "discord_text_channel" "admin" {
  name      = "admin"
  server_id = discord_server.server.id
  category  = discord_category_channel.management.id
  position  = 1
}

resource "discord_text_channel" "community-update" {
  name      = "community-update"
  server_id = discord_server.server.id
  category  = discord_category_channel.management.id
  position  = 2
}
