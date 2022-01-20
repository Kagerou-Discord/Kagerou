resource "discord_message" "hello_world" {
  channel_id = discord_text_channel.rule.id
  content    = "hello world!"
}
