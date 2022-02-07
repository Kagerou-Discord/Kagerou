resource "discord_server" "server" {
  name                          = "Kagerou"
  region                        = "japan"
  owner_id                      = "933006368443604992"
  default_message_notifications = 1
  explicit_content_filter       = 2
  verification_level            = 4
  icon_url                      = "https://github.com/Kagerou-Discord/Kagerou/blob/main/server_icon.jpg?raw=true"
}
