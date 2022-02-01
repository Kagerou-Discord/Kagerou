resource "discord_message" "newcomer" {
  channel_id = discord_text_channel.newcomer.id
  content    = <<-EOT
    ようこそ。
    このDiscordサーバーは、Lucky3028というひとの個人的なサーバーです。
    荒らし対策等のため、初めて参加された方はこのチャンネルのみ閲覧できます（書き込みはどのチャンネルにも行えません）。
    管理者が確認ののち、他のチャンネルを閲覧できるようになりますので、いましばらくお待ちください。
    なお、その仕様のため、一見さんはお断りさせていただく可能性がございます。
  EOT
  pinned     = true
}

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
