local function HMPlayerInitialSpawn(ply)
    ply:newHungerData()
end
hook.Add("PlayerInitialSpawn", "HMPlayerInitialSpawn", HMPlayerInitialSpawn)

local function HMPlayerSpawn(ply)
    ply:setSelfDarkRPVar("Energy", 100)
end
hook.Add("PlayerSpawn", "HMPlayerSpawn", HMPlayerSpawn)

local function HMThink()
    for _, v in ipairs(player.GetAll()) do
        if not v:Alive() then continue end
        v:hungerUpdate()

        -- Regenerate health if energy is high
        if v:getDarkRPVar("Energy") > 75 and v:Health() < 75 then
            v:SetHealth(math.min(v:Health() + 1, 75))
        end
    end
end
timer.Create("HMThink", 10, 0, HMThink)

-- Table pour cooldown individuel de notification
hungerLowNotifyCooldown = {}

local function HungerLowNotify()
    local now = CurTime()
    for _, ply in ipairs(player.GetAll()) do
        local energy = ply:getDarkRPVar("Energy")
        if not energy or energy >= 25 then continue end

        -- Utilisation de SteamID64 pour éviter les problèmes de référence d'objet
        local sid = ply:SteamID64()
        local last = hungerLowNotifyCooldown[sid] or 0

        -- Le joueur ne doit recevoir qu'un message toutes les 5 minutes max
        if now - last < (60*5) then continue end
        hungerLowNotifyCooldown[sid] = now

        local adoMsg, notifyMsg
        local hp = ply:Health() or 100

        if energy < 6 then
            adoMsg = "L'individu semble très pâle et vacille, il paraît au bord du malaise."
            if hp <= 15 then
                notifyMsg = "Vous êtes au bord de l'évanouissement, votre vision se trouble et vous tenez à peine debout ! Mangez immédiatement ou vous risquez de tomber inconscient."
            elseif hp <= 30 then
                notifyMsg = "Votre tête tourne, vous êtes très faible et votre santé est critique. Mangez vite !"
            else
                notifyMsg = "Vous êtes extrêmement faible, votre tête tourne et vous avez du mal à tenir debout ! Mangez immédiatement."
            end
        elseif energy < 11 then
            adoMsg = "L'individu a le visage blême et vacille légèrement."
            if hp <= 20 then
                notifyMsg = "Votre faim aggrave votre état de santé déjà bas, vous vous sentez très mal."
            else
                notifyMsg = "Votre tête commence à tourner, vous vous sentez très faible. Mangez vite !"
            end
        elseif energy < 16 then
            adoMsg = "Le ventre de l'individu gargouille bruyamment."
            if hp <= 20 then
                notifyMsg = "Votre faim se fait sentir et votre santé est basse, soyez prudent."
            else
                notifyMsg = "Votre ventre gargouille fort, la faim devient difficile à ignorer."
            end
        else -- energy < 25
            adoMsg = "Le ventre de l'individu se met à gargouiller."
            if hp <= 20 then
                notifyMsg = "Vous commencez à avoir faim et votre santé est faible, pensez à manger bientôt."
            else
                notifyMsg = "Vous commencez à avoir faim, pensez à manger bientôt."
            end
        end

        ply:ConCommand("say /ado " .. adoMsg)
        DarkRP.notify(ply, 1, 8, notifyMsg)
    end
end

timer.Create("HungerLowNotify", 60, 0, HungerLowNotify)

local function BuyFood(ply, args)
    if args == "" then
        DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", DarkRP.getPhrase("arguments"), ""))
        return ""
    end

    for _, v in pairs(FoodItems) do
        if string.lower(args) ~= string.lower(v.name) then continue end

        if (v.requiresCook == nil or v.requiresCook == true) and not ply:isCook() then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("unable", "/buyfood", DarkRP.getPhrase("cooks_only")))
            return ""
        end

        if v.customCheck and not v.customCheck(ply) then
            if v.customCheckMessage then
                DarkRP.notify(ply, 1, 4, v.customCheckMessage)
            end
            return ""
        end

        local foodTable = {
            cmd = "buyfood",
            max = GAMEMODE.Config.maxfooditems
        }

        if ply:customEntityLimitReached(foodTable) then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("limit", GAMEMODE.Config.chatCommandPrefix .. "buyfood"))

            return ""
        end

        ply:addCustomEntity(foodTable)

        local cost = v.price

        if not ply:canAfford(cost) then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("cant_afford", DarkRP.getPhrase("food")))
            return ""
        end
        ply:addMoney(-cost)
        DarkRP.notify(ply, 0, 4, DarkRP.getPhrase("you_bought", v.name, DarkRP.formatMoney(cost), ""))

        local trace = {}
        trace.start = ply:EyePos()
        trace.endpos = trace.start + ply:GetAimVector() * 85
        trace.filter = ply

        local tr = util.TraceLine(trace)

        local SpawnedFood = ents.Create("spawned_food")
        SpawnedFood.DarkRPItem = foodTable
        SpawnedFood:Setowning_ent(ply)
        SpawnedFood:SetPos(tr.HitPos)
        SpawnedFood.onlyremover = true
        SpawnedFood.SID = ply.SID
        SpawnedFood:SetModel(v.model)

        -- for backwards compatibility
        SpawnedFood.FoodName = v.name
        SpawnedFood.FoodEnergy = v.energy
        SpawnedFood.FoodPrice = v.price

        SpawnedFood.foodItem = v
        SpawnedFood:Spawn()

        DarkRP.placeEntity(SpawnedFood, tr, ply)

        hook.Call("playerBoughtFood", nil, ply, v, SpawnedFood, cost)
        return ""
    end
    DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", DarkRP.getPhrase("arguments"), ""))
    return ""
end
DarkRP.defineChatCommand("buyfood", BuyFood)