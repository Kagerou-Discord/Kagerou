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

resource discord_server etoile {
    name = "Etoile"
    region = "japan"
    default_message_notifications = 1
    owner_id = var.OWNER_ID
}

resource discord_text_channel general {
  name = "general"
  server_id = resource.etoile.id
}
