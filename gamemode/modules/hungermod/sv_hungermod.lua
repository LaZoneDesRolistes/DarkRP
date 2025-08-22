-- Timer toutes les 10 minutes pour signaler la faim très basse
local function HungerLowNotify()
    for _, ply in ipairs(player.GetAll()) do
        if ply:getDarkRPVar("Energy") and ply:getDarkRPVar("Energy") < 10 then
            -- Exécute la commande /ado
            ply:ConCommand("say /ado Le ventre de l'individu gargouille.")
            -- Envoie un message indicatif
            DarkRP.notify(ply, 1, 8, "Votre ventre gargouille, vous devriez manger quelque chose !")
        end
    end
end

timer.Create("HungerLowNotify", 600, 0, HungerLowNotify) -- 600 secondes = 10 minutes

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

-- Optimization : round robin on the players to avoid load spikes
local hungermod_rr_index = 1
local hungermod_rr_batch = 8 -- Number of players processed per tick (adjustable)
local hungermod_rr_interval = 1 -- Timer interval in seconds (more frequent, less load per tick)

local function HMThinkOptimized()
    local players = player.GetAll()
    local total = #players
    if total == 0 then return end

    -- Calculate the range of players to process
    local startIdx = hungermod_rr_index
    local endIdx = math.min(hungermod_rr_index + hungermod_rr_batch - 1, total)

    for i = startIdx, endIdx do
        local v = players[i]
        if IsValid(v) and v:Alive() then
            v:hungerUpdate()
        end
    end

    -- Update the index for the next tick
    hungermod_rr_index = endIdx + 1
    if hungermod_rr_index > total then
        hungermod_rr_index = 1
    end
end

timer.Create("HMThinkOptimized", hungermod_rr_interval, 0, HMThinkOptimized)

local function HMPlayerInitialSpawn(ply)
    ply:newHungerData()
end
hook.Add("PlayerInitialSpawn", "HMPlayerInitialSpawn", HMPlayerInitialSpawn)



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
