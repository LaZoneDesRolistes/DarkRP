--[[--------------------------------------------------------
Ce fork ne livre plus de métiers par défaut.

Les métiers, groupes de portes, agendas, chats de groupe, groupes de rétrogradation
et catégories du serveur vivent dans addons/darkrpmodification/lua/darkrp_customthings/,
avec GAMEMODE.DefaultTeam et GAMEMODE.CivilProtection (jobs.lua).

Ne subsiste ici que la catégorie « Other » : DarkRP.mergeCategories y renvoie tout
objet dont la catégorie est introuvable (modules/base/sh_createitems.lua). Sans elle,
le premier objet mal catégorisé indexe nil et fait planter le chargement.
--------------------------------------------------------]]

DarkRP.createCategory{
    name = "Other",
    categorises = "jobs",
    startExpanded = true,
    color = Color(0, 107, 0, 255),
    canSee = fp{fn.Id, true},
    sortOrder = 255,
}
