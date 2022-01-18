terraform {
  required_providers {
    discord = {
      source = "aequasi/discord"
      version = "0.0.4"
    }
  }
}

variable "DISCORD_TOKEN" {}
variable "OWNER_ID" {}

provider discord {
    token = var.DISCORD_TOKEN
}

resource discord_server my_server {
    name = "Etoile"
    region = "japan"
    default_message_notifications = 1
    owner_id = var.OWNER_ID
}
