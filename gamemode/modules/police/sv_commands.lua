local function updateAgenda(ply, agenda, text)
    local txt = hook.Run("agendaUpdated", ply, agenda, text)

    agenda.text = txt or text

    local phrase = DarkRP.getPhrase("agenda_updated")
    for _, v in ipairs(player.GetAll()) do
        if v:getAgendaTable() ~= agenda then continue end

        v:setSelfDarkRPVar("agenda", agenda.text)
        DarkRP.notify(v, 2, 4, phrase)
    end
end

local function CreateAgenda(ply, args)
    local agenda = ply:getAgendaTable()

    if not agenda or not agenda.ManagersByKey[ply:Team()] then
        DarkRP.notify(ply, 1, 6, DarkRP.getPhrase("incorrect_job", DarkRP.getPhrase("agenda")))
        return ""
    end

    updateAgenda(ply, agenda, args)

    return ""
end
DarkRP.defineChatCommand("agenda", CreateAgenda, 0.1)

local function addAgenda(ply, args)
    local agenda = ply:getAgendaTable()

    if not agenda or not agenda.ManagersByKey[ply:Team()] then
        DarkRP.notify(ply, 1, 6, DarkRP.getPhrase("incorrect_job", DarkRP.getPhrase("agenda")))
        return ""
    end

    agenda.text = agenda.text or ""
    args = args or ""

    updateAgenda(ply, agenda, agenda.text .. '\n' .. args)

    return ""
end
DarkRP.defineChatCommand("addagenda", addAgenda, 0.1)

--[[---------------------------------------------------------
 Mayor stuff
 ---------------------------------------------------------]]

local lastLockdown = -math.huge
function DarkRP.lockdown(ply)
    local show = ply:EntIndex() == 0 and print or fp{DarkRP.notify, ply, 1, 4}
    if GetGlobalBool("DarkRP_LockDown") then
        show(DarkRP.getPhrase("unable", "/lockdown", DarkRP.getPhrase("stop_lockdown")))
        return ""
    end

    if ply:EntIndex() ~= 0 and not ply:isMayor() then
        show(DarkRP.getPhrase("incorrect_job", "/lockdown", ""))
        return ""
    end

    if not GAMEMODE.Config.lockdown then
        show(ply, 1, 4, DarkRP.getPhrase("disabled", "lockdown", ""))
        return ""
    end

    if lastLockdown > CurTime() - GAMEMODE.Config.lockdowndelay then
        show(DarkRP.getPhrase("wait_with_that"))
        return ""
    end

    for _, v in ipairs(player.GetAll()) do
        v:ConCommand("play " .. GAMEMODE.Config.lockdownsound .. "\n")
    end

    DarkRP.printMessageAll(HUD_PRINTTALK, DarkRP.getPhrase("lockdown_started"))
    SetGlobalBool("DarkRP_LockDown", true)
    DarkRP.notifyAll(0, 3, DarkRP.getPhrase("lockdown_started"))

    hook.Run("lockdownStarted", ply)

    return ""
end
DarkRP.defineChatCommand("lockdown", DarkRP.lockdown)

function DarkRP.unLockdown(ply)
    local show = ply:EntIndex() == 0 and print or fp{DarkRP.notify, ply, 1, 4}

    if not GetGlobalBool("DarkRP_LockDown") then
        show(DarkRP.getPhrase("unable", "/unlockdown", DarkRP.getPhrase("lockdown_ended")))
        return ""
    end

    if ply:EntIndex() ~= 0 and not ply:isMayor() then
        show(DarkRP.getPhrase("incorrect_job", "/unlockdown", ""))
        return ""
    end

    DarkRP.printMessageAll(HUD_PRINTTALK, DarkRP.getPhrase("lockdown_ended"))
    DarkRP.notifyAll(0, 3, DarkRP.getPhrase("lockdown_ended"))
    SetGlobalBool("DarkRP_LockDown", false)

    lastLockdown = CurTime()

    hook.Run("lockdownEnded", ply)

    return ""
end
DarkRP.defineChatCommand("unlockdown", DarkRP.unLockdown)

--[[---------------------------------------------------------
 License
 ---------------------------------------------------------]]

local function GiveLicense(ply)
    local LookingAt = ply:GetEyeTrace().Entity
    if not IsValid(LookingAt) or not LookingAt:IsPlayer() or LookingAt:GetPos():DistToSqr(ply:GetPos()) > 10000 then
        DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("must_be_looking_at", DarkRP.getPhrase("player")))
        return ""
    end

    local canGive, cantGiveReason = hook.Call("canGiveLicense", DarkRP.hooks, ply, LookingAt)
    if canGive == false then
        cantGiveReason = isstring(cantGiveReason) and cantGiveReason or DarkRP.getPhrase("unable", "/givelicense", "")
        DarkRP.notify(ply, 1, 4, cantGiveReason)
        return ""
    end

    DarkRP.notify(LookingAt, 0, 4, DarkRP.getPhrase("gunlicense_granted", ply:Nick(), LookingAt:Nick()))
    DarkRP.notify(ply, 0, 4, DarkRP.getPhrase("gunlicense_granted", ply:Nick(), LookingAt:Nick()))
    LookingAt:setDarkRPVar("HasGunlicense", true)

    hook.Run("playerGotLicense", LookingAt, ply)

    return ""
end
DarkRP.defineChatCommand("givelicense", GiveLicense)

local function rp_GiveLicense(ply, arg)
    local target = DarkRP.findPlayer(arg)

    if not target then
        DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("could_not_find", tostring(arg)))
        return
    end

    target:setDarkRPVar("HasGunlicense", true)

    local nick, steamID
    if ply:EntIndex() ~= 0 then
        nick = ply:Nick()
        steamID = ply:SteamID()
    else
        nick = "Console"
        steamID = "Console"
    end

    DarkRP.notify(target, 0, 4, DarkRP.getPhrase("gunlicense_granted", nick, target:Nick()))
    if ply ~= target then
        DarkRP.notify(ply, 0, 4, DarkRP.getPhrase("gunlicense_granted", nick, target:Nick()))
    end
    DarkRP.log(nick .. " (" .. steamID .. ") force-gave " .. target:Nick() .. " a gun license", Color(30, 30, 30))
end
DarkRP.definePrivilegedChatCommand("setlicense", "DarkRP_SetLicense", rp_GiveLicense)

local function rp_RevokeLicense(ply, arg)
    local target = DarkRP.findPlayer(arg)

    if not target then
        DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("could_not_find", tostring(arg)))
        return
    end

    target:setDarkRPVar("HasGunlicense", nil)

    local nick, steamID
    if ply:EntIndex() ~= 0 then
        nick = ply:Nick()
        steamID = ply:SteamID()
    else
        nick = "Console"
        steamID = "Console"
    end

    DarkRP.notify(target, 1, 4, DarkRP.getPhrase("gunlicense_denied", nick, target:Nick()))
    if ply ~= target then
        DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("gunlicense_denied", nick, target:Nick()))
    end
    DarkRP.log(nick .. " (" .. steamID .. ") force-removed " .. target:Nick() .. "'s gun license", Color(30, 30, 30))
end
DarkRP.definePrivilegedChatCommand("unsetlicense", "DarkRP_SetLicense", rp_RevokeLicense)

