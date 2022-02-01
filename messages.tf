resource "discord_message" "about" {
  channel_id = discord_text_channel.about.id
  content    = "これはテスト\nあいうえお"
}
