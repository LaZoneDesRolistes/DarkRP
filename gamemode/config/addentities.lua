--[[--------------------------------------------------------
Ce fork ne livre plus d'expéditions ni d'entités achetables par défaut.

Les dix expéditions et cinq entités d'origine pointaient toutes vers des SWEP/SENT
que ce fork n'embarque pas (weapon_ak472, drug_lab, money_printer, microwave…) et
étaient déjà toutes désactivées par addons/darkrpmodification/lua/darkrp_config/.
Le contenu achetable du serveur vient des addons r*.

Ne subsistent ici que les catégories « Other » : DarkRP.mergeCategories y renvoie
tout objet dont la catégorie est introuvable (modules/base/sh_createitems.lua).
Sans elles, le premier objet mal catégorisé indexe nil et fait planter le chargement.
--------------------------------------------------------]]

DarkRP.createCategory{
    name = "Other",
    categorises = "entities",
    startExpanded = true,
    color = Color(0, 107, 0, 255),
    canSee = fp{fn.Id, true},
    sortOrder = 255,
}

DarkRP.createCategory{
    name = "Other",
    categorises = "shipments",
    startExpanded = true,
    color = Color(0, 107, 0, 255),
    canSee = fp{fn.Id, true},
    sortOrder = 255,
}

DarkRP.createCategory{
    name = "Other",
    categorises = "weapons",
    startExpanded = true,
    color = Color(0, 107, 0, 255),
    canSee = fp{fn.Id, true},
    sortOrder = 255,
}

DarkRP.createCategory{
    name = "Other",
    categorises = "vehicles",
    startExpanded = true,
    color = Color(0, 107, 0, 255),
    canSee = fp{fn.Id, true},
    sortOrder = 255,
}
