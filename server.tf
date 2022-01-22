resource "discord_server" "server" {
  name                          = "Kagerou"
  region                        = "japan"
  owner_id                      = "933006368443604992"
  default_message_notifications = 1
  explicit_content_filter       = 2
  system_channel_id             = discord_text_channel.system.id
}
