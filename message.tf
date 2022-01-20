locals {
  rules = [
    "これは",
    "テスト用の",
    "ルールだよ"
  ]
}

resource "discord_message" "hello_world" {
  channel_id = discord_text_channel.rule.id
  for_each   = toset(local.rules)
  content    = each.value
}
