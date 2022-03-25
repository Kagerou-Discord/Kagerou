resource "discord_message" "newcomer" {
  channel_id = discord_text_channel.newcomer.id
  content    = <<-EOT
    ようこそ。
    このDiscordサーバーは、<@255951609174032385>というひとの個人的なサーバーです。
    荒らし対策等のため、初めて参加された方はこのチャンネルのみ閲覧できます（書き込みは行えません）。
    管理者が最大24時間以内に確認したあと、他のチャンネルを閲覧できるようになります。いましばらくお待ちください。
    なお、その仕様のため、一見さんはお断りさせていただく可能性がございます。
  EOT
  pinned     = true
}

resource "discord_message" "about-ch" {
  channel_id = discord_text_channel.board.id
  content    = <<-EOT
    **[各チャンネルの説明]**

    本Discordサーバーの各チャンネルの説明については、各チャンネルのトピックまたは以下のURLをご覧ください。
    https://github.com/Kagerou-Discord/docs/blob/main/channels.md

    変更履歴はこちら。
    https://github.com/Kagerou-Discord/docs/commits/main/channels.md
  EOT
  pinned     = true
}

resource "discord_message" "about-server" {
  channel_id = discord_text_channel.board.id
  content    = <<-EOT
    **[本サーバーの細々とした説明]**

    本Discordサーバーについての細々とした説明については、以下のURLをご覧ください。
    https://github.com/Kagerou-Discord/docs/blob/main/about.md

    変更履歴はこちら。
    https://github.com/Kagerou-Discord/docs/commits/main/about.md
  EOT
  pinned     = true
}

resource "discord_message" "invite" {
  channel_id = discord_text_channel.board.id
  content    = <<-EOT
    **[本サーバーへの招待リンク]**
    
    本Discordサーバーへの招待リンクはこちらをご利用ください。
    https://discord.gg/${discord_invite.invite_to_newcomer.id}
  EOT
  pinned     = true
}

resource "discord_message" "rule" {
  channel_id = discord_text_channel.rule.id
  content    = <<-EOT
    本Discordサーバーのルールについては、以下のURLをご覧ください。
    https://github.com/Kagerou-Discord/docs/blob/main/rules.md

    変更履歴はこちら。
    https://github.com/Kagerou-Discord/docs/commits/main/rules.md
  EOT
  pinned     = true
}
