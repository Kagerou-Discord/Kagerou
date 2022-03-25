data "discord_permission" "not_accessible" {
  view_channel = "deny"
}

data "discord_permission" "read_only" {
  view_channel         = "allow"
  send_messages        = "deny"
  read_message_history = "allow"
  add_reactions        = "allow"
}

data "discord_permission" "read_and_write" {
  allow_extends         = data.discord_permission.read_only.allow_bits
  send_messages         = "allow"
  create_public_threads = "allow"
  send_thread_messages  = "allow"
  use_external_stickers = "allow"
  use_external_emojis   = "allow"
  attach_files          = "allow"
}

data "discord_permission" "admin" {
  allow_extends = data.discord_permission.read_and_write.allow_bits
  administrator = "allow"
}

data "discord_permission" "everyone" {
  change_nickname = "allow"
}
