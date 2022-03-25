resource "discord_invite" "invite_to_rule" {
  channel_id = discord_text_channel.rule.id
  max_age    = 0
}
