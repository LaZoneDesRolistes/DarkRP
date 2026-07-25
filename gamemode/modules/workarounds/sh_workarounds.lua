-- Shared part

function DarkRP.getAvailableVehicles()
    local vehicles = list.Get("Vehicles")
    for _, v in pairs(list.Get("SCarsList")) do
        vehicles[v.PrintName] = {
            Name = v.PrintName,
            Class = v.ClassName,
            Model = v.CarModel
        }
    end

    return vehicles
end

local function argError(Val, iArg, sType)
    error(string.format("bad argument #%u to '%s' (%s expected, got %s)", iArg, debug.getinfo(2, "n").name, sType, type(Val)), 3)
end

if not DarkRP.disabledDefaults["workarounds"]["os.date() Windows crash"] and system.IsWindows() then
    local osdate = os.date
    local replace = function(txt)
        if txt == "%%" then return txt end -- Edge case, %% is allowed
        return ""
    end

    function os.date(format, time, ...)
        if (isstring(format) or isnumber(format)) then
            format = string.gsub(format, "%%[^aAbBcdHIjmMpSUwWxXyYz]", replace)
        elseif (format ~= nil) then
            argError(Val, 1, "string")
        end

        if (not (time == nil or isnumber(time)) and (not isstring(time) or tonumber(time) == nil)) then
            argError(Val, 2, "number")
        end

        return osdate(format, time, ...)
    end
end

if SERVER and not DarkRP.disabledDefaults["workarounds"]["Error on edict limit"] then
    -- https://github.com/FPtje/DarkRP/issues/2640
    local entsCreate = ents.Create
    local entsCreateError = [[
    Unable to create entity.

    The server has come to a point where it has become impossible to create new
    entities. The entity limit has been hit. Try cleaning up the server or
    changing level. In the meantime, expect lots of errors coming from a lot of
    addons.

    If you do decide to send a bug report to ANY addon, please include this
    message.]]

    local function varArgsLen(...)
        return {...}, select("#", ...)
    end

    function ents.Create(name, ...)
        local res, len = varArgsLen(entsCreate(name, ...))

        if res[1] == NULL and ents.GetEdictCount() >= 8176 then
            DarkRP.error(entsCreateError, 2, {string.format("Affected entity: '%s'", name)})
        end

        return unpack(res, 1, len)
    end
end

--[[---------------------------------------------------------------------------
Generic InitPostEntity workarounds
---------------------------------------------------------------------------]]
hook.Add("InitPostEntity", "DarkRP_Workarounds", function()
    if CLIENT then
        if not DarkRP.disabledDefaults["workarounds"]["White flashbang flashes"] then
            -- Removes the white flashes when the server lags and the server has flashbang. Workaround because it's been there for fucking years
            hook.Remove("HUDPaint","drawHudVital")
        end

        return
    end
    -- why can people even save multiplayer games?
    -- Lag exploit
    if not DarkRP.disabledDefaults["workarounds"]["gm_save"] then
        concommand.Remove("gm_save")
    end

end)

--[[---------------------------------------------------------------------------
Anti crash exploit
---------------------------------------------------------------------------]]
if SERVER and not DarkRP.disabledDefaults["workarounds"]["Constraint crash exploit fix"] then
    hook.Add("PropBreak", "drp_AntiExploit", function(attacker, ent)
        if IsValid(ent) and ent:GetPhysicsObject():IsValid() then
            constraint.RemoveAll(ent)
        end
    end)
end
