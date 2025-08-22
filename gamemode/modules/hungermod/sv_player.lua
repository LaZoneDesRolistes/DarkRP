local meta = FindMetaTable("Player")

function meta:newHungerData()
    self:setSelfDarkRPVar("Energy", 100)
end

function meta:hungerUpdate()
    if not GAMEMODE.Config.hungerspeed then return end

    local energy = self:getDarkRPVar("Energy")
    local override = hook.Call("hungerUpdate", nil, self, energy)

    if override then return end

    self:setSelfDarkRPVar("Energy", energy and math.Clamp(energy - GAMEMODE.Config.hungerspeed, 0, 100) or 100)

    if self:getDarkRPVar("Energy") == 0 then
        local health = self:Health()
        if health > 10 then
            local dmg = DamageInfo()
            local dmgAmount = math.min(GAMEMODE.Config.starverate, health - 10)
            dmg:SetDamage(dmgAmount)
            dmg:SetInflictor(self)
            dmg:SetAttacker(self)
            dmg:SetDamageType(bit.bor(DMG_DISSOLVE, DMG_NERVEGAS))
            self:TakeDamageInfo(dmg)
        end
        -- Ne jamais descendre sous 10 HP, ni tuer le joueur
        if self:Health() < 10 then
            self:SetHealth(10)
        end
    end
end
