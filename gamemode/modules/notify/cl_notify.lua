--[[---------------------------------------------------------------------------
Affichage des notifications DarkRP.

Ce hook vivait dans gamemode/modules/hud/cl_hud.lua, supprimé avec tout le module
hud par f4d5144. Sans lui, les appels à DarkRP.notify/notifyAll produisent
"Unhandled usermessage '_Notify'" côté client et rien à l'écran.
---------------------------------------------------------------------------]]
local function DisplayNotify(msg)
    local txt = msg:ReadString()
    -- AddNotify vient de sandbox (gamemodes/sandbox/gamemode/cl_notice.lua), dont DarkRP
    -- dérive ; il n'est pas dans les définitions du wiki, d'où l'annotation.
    ---@diagnostic disable-next-line: undefined-field
    GAMEMODE:AddNotify(txt, msg:ReadShort(), msg:ReadLong())

    local snd = GAMEMODE.Config and GAMEMODE.Config.notificationSound
    if snd then surface.PlaySound(snd) end

    MsgC(Color(255, 20, 20, 255), "[DarkRP] ", Color(200, 200, 200, 255), txt, "\n")
end
-- Transport volontairement laissé en usermessage : les HUD tiers du marché s'accrochent
-- à usermessage.Hook("_Notify"). Passer sv_util.lua au net library les casserait tous.
---@diagnostic disable-next-line: deprecated
usermessage.Hook("_Notify", DisplayNotify)
