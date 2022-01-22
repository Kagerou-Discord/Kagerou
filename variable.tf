variable "discord_token" {
  type        = string
  description = "Token of the discord bot."
  sensitive   = true
}

locals {
  server_id = "933543574975414312"
}
