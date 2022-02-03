resource "discord_text_channel" "newcomer" {
  name                     = "for-newcomers"
  server_id                = local.server_id
  topic                    = "最初にサーバーに参加された方はこちらのチャンネルのみ閲覧可能です。"
  sync_perms_with_category = false
}

resource "discord_text_channel" "rule" {
  name      = "rule"
  server_id = local.server_id
  category  = discord_category_channel.announce.id
  topic     = "本サーバーのルールです。"
  position  = 0
}

resource "discord_text_channel" "board" {
  name      = "お得な掲示板"
  server_id = local.server_id
  category  = discord_category_channel.announce.id
  topic     = "本サーバーを利用する上でお得な情報を掲載しています。"
  position  = 1
}

resource "discord_text_channel" "news" {
  name      = "news"
  server_id = local.server_id
  category  = discord_category_channel.announce.id
  topic     = "皆さまへのお知らせです。"
  position  = 2
}

resource "discord_text_channel" "general" {
  name      = "general"
  server_id = local.server_id
  category  = discord_category_channel.general.id
  topic     = "皆さまの交流のためにご自由にお使いいただけます。"
  position  = 0
}

resource "discord_text_channel" "oshi" {
  name      = "推し"
  server_id = local.server_id
  category  = discord_category_channel.general.id
  topic     = "あなたの「推し」を宣伝してください。メンション禁止。"
  position  = 1
}

resource "discord_text_channel" "idea" {
  name      = "idea"
  server_id = local.server_id
  category  = discord_category_channel.general.id
  topic     = "ご意見・ご要望がありましたら、こちらにご投稿ください。"
  position  = 2
}

resource "discord_text_channel" "neta_photo" {
  name      = "ネタ画像"
  server_id = local.server_id
  category  = discord_category_channel.general.id
  topic     = "Twitter等で使えるようなネタ画像を集めています。"
  position  = 3
}

resource "discord_text_channel" "system" {
  name      = "system-log"
  server_id = local.server_id
  category  = discord_category_channel.read_only.id
  topic     = "Discordがシステムイベントメッセージを送信します。"
  position  = 0
}

resource "discord_text_channel" "role" {
  name      = "role"
  server_id = local.server_id
  category  = discord_category_channel.read_only.id
  topic     = "特殊なロールを獲得いただけます。"
  position  = 1
}

resource "discord_text_channel" "stock" {
  name      = "stock"
  server_id = local.server_id
  category  = discord_category_channel.read_only.id
  topic     = "メモです。"
  position  = 2
}

resource "discord_text_channel" "stock_r18" {
  name                     = "stock-r18"
  server_id                = local.server_id
  category                 = discord_category_channel.read_only.id
  topic                    = "メモです。口外禁止。"
  nsfw                     = true
  position                 = 3
  sync_perms_with_category = false
}

resource "discord_text_channel" "thumbs_down" {
  name                     = "👎"
  server_id                = local.server_id
  category                 = discord_category_channel.read_only.id
  topic                    = "闇です。口外禁止。"
  nsfw                     = true
  position                 = 4
  sync_perms_with_category = false
}

resource "discord_text_channel" "admin" {
  name      = "admin"
  server_id = local.server_id
  category  = discord_category_channel.management.id
  topic     = "管理者用です。基本口外禁止。"
  position  = 0
}

resource "discord_text_channel" "report" {
  name      = "report"
  server_id = local.server_id
  category  = discord_category_channel.management.id
  topic     = "通報が行われた場合はこちらに通知されます。"
  position  = 1
}

resource "discord_text_channel" "command" {
  name      = "command"
  server_id = local.server_id
  category  = discord_category_channel.management.id
  topic     = "基本的にコマンドはこちらで実行してください。"
  position  = 2
}

resource "discord_text_channel" "carl_log" {
  name      = "carl-log"
  server_id = local.server_id
  category  = discord_category_channel.management.id
  topic     = "Carl-botのログです。"
  position  = 3
}

resource "discord_text_channel" "punishment_log" {
  name      = "punishment-log"
  server_id = local.server_id
  category  = discord_category_channel.management.id
  topic     = "Carl-botの処罰ログです。"
  position  = 4
}

resource "discord_text_channel" "community-update" {
  name      = "community-update"
  server_id = local.server_id
  category  = discord_category_channel.management.id
  topic     = "Discordが送信するコミュニティアップデート情報です。"
  position  = 5
}
