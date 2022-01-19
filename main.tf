terraform {
  required_providers {
    discord = {
      source = "aequasi/discord"
      version = "0.0.4"
    }
  }
}

variable "DISCORD_TOKEN" {}

provider discord {
    token = var.DISCORD_TOKEN
}

resource discord_server etoile {
    name = "Kagerou"
    region = "japan"
    default_message_notifications = 1
}

resource discord_category_channel general {
  name = "general"
  server_id = discord_server.etoile.id
  position = 0
}

resource discord_text_channel general {
  name = "general"
  server_id = discord_server.etoile.id
  category = discord_category_channel.general.id
}

resource discord_invite invite_to_general {
  channel_id = discord_text_channel.general.id
  max_age = 0
}
