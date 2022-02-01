resource "discord_message" "about" {
  channel_id = discord_text_channel.about.id
  content    = <<-EOT
    本Discordサーバーの各チャンネルの説明については、各チャンネルのトピックまたは以下のURLをご覧ください。
    https://github.com/Kagerou-Discord/docs/blob/main/channels.md"

    変更履歴はこちら。
    https://github.com/Kagerou-Discord/docs/commits/main/channels.md
  EOT
  pinned     = true
}
