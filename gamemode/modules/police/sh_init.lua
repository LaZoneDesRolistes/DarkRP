local plyMeta = FindMetaTable("Player")

--[[---------------------------------------------------------------------------
Interface functions
---------------------------------------------------------------------------]]
function plyMeta:isArrested()
    return self:getDarkRPVar("Arrested")
end

function plyMeta:isWanted()
    return self:getDarkRPVar("wanted")
end

function plyMeta:getWantedReason()
    return self:getDarkRPVar("wantedReason")
end

function plyMeta:isCP()
    return GAMEMODE.CivilProtection and GAMEMODE.CivilProtection[self:Team()] or false
end

plyMeta.isMayor = fn.Compose{fn.Curry(fn.GetValue, 2)("mayor"), plyMeta.getJobTable}
plyMeta.isChief = fn.Compose{fn.Curry(fn.GetValue, 2)("chief"), plyMeta.getJobTable}

--[[---------------------------------------------------------------------------
Il ne reste ici que les prédicats.

Le comportement policier de DarkRP -- arrestation, wanted, mandat, prison,
lockdown, agenda, lois, licences -- a été retiré le 25/07/2026 : rJustice le
remplace (docs/specs/2026-07-25-rjustice-design.md, phase 3 puis 7).

Ces six fonctions restent parce qu'elles sont appelées depuis du code conservé --
base, money, doorsystem, les SWEP de police et darkrp_customthings/groupchats.lua.
isCP demeure exact (c'est un test d'équipe) ; isArrested et isWanted lisent une
DarkRPVar que plus rien ne pose, donc renvoient constamment faux. C'est la couture
que rJustice viendra remplir.
---------------------------------------------------------------------------]]
