--[[---------------------------------------------------------------------------
Ce serveur n'a qu'une langue : l'anglais (sh_english.lua).

La machinerie multilingue de DarkRP a été retirée le 25/07/2026 -- sélection par la
convar gmod_language, phrases localisées par joueur, traduction des descriptions de
commandes, et les deux concommands d'aide à la traduction. Rien ne s'en servait :
aucun réglage de langue dans darkrp_config, aucun `DarkRP.addLanguage` hors de
sh_english.lua, et `getPhraseLocalized` lisait un `GetInfo` par joueur pour toujours
retomber sur `en`.

`getMissingPhrases` partait avec un bug latent : sans argument, elle indexait
`rp_languages[lang]` sans garde et plantait dès que gmod_language valait autre chose
que "en".

`DarkRP.addPhrase` reste : c'est le point d'entrée par lequel un addon ajoute ou
remplace une phrase, et il ne coûte rien.
---------------------------------------------------------------------------]]

local rp_languages = {}

function DarkRP.addLanguage(name, tbl)
    local old = rp_languages[name] or {}
    rp_languages[name] = tbl

    -- Fusion avec les traductions déjà ajoutées par DarkRP.addPhrase
    for k, v in pairs(old) do
        if rp_languages[name][k] then continue end
        rp_languages[name][k] = v
    end
    LANGUAGE = rp_languages[name] -- compatibilité ascendante
end

function DarkRP.addPhrase(lang, name, phrase)
    rp_languages[lang] = rp_languages[lang] or {}
    rp_languages[lang][name] = phrase
end

function DarkRP.getPhrase(name, ...)
    local phrase = rp_languages.en[name]

    return phrase and string.format(phrase, ...) or nil
end
