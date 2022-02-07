locals {
  admin_members = [
    "255951609174032385",
    "933006368443604992"
  ]

  members = [
    "889808240454561853"
  ]
}

resource "discord_member_roles" "admin" {
  for_each  = toset(local.admin_members)
  user_id   = each.value
  server_id = local.server_id
  role {
    role_id = discord_role.admin.id
  }
}

resource "discord_member_roles" "member" {
  for_each  = toset(local.members)
  user_id   = each.value
  server_id = local.server_id
  role {
    role_id = discord_role.member.id
  }
}
