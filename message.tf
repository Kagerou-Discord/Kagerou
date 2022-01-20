locals {
  rules = [
    "これは",
    "テスト用の",
    "ルールだよ"
  ]
}

resource "discord_message" "hello_world" {
  channel_id = discord_text_channel.rule.id
  for_each   = toset(locals.rules)
  content    = each.value
}
