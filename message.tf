resource "discord_message" "hello_world" {
  channel_id = discord_text_channel.rule.id
  content    = "This is a test message!"
}
