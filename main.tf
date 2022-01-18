provider discord {
    token = var.DISCORD_TOKEN
}

resource discord_server my_server {
    name = "Etoile"
    region = "japan"
    default_message_notifications = 1
}
