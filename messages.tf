resource "discord_message" "about" {
  channel_id = discord_text_channel.about.id
  content    = "本Discordサーバーの各チャンネルの説明については、以下のURLをご覧ください。\nhttps://github.com/Kagerou-Discord/docs/blob/main/channels.md"
  pinned     = true
}
