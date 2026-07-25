DarkRP.PLAYER.isWanted = DarkRP.stub{
    name = "isWanted",
    description = "Whether this player is wanted",
    parameters = {
    },
    returns = {
        {
            name = "answer",
            description = "Whether this player is wanted",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.PLAYER.getWantedReason = DarkRP.stub{
    name = "getWantedReason",
    description = "Get the reason why someone is wanted",
    parameters = {
    },
    returns = {
        {
            name = "answer",
            description = "The reason",
            type = "string"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.PLAYER.isArrested = DarkRP.stub{
    name = "isArrested",
    description = "Whether this player is arrested",
    parameters = {
    },
    returns = {
        {
            name = "answer",
            description = "Whether this player is arrested",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.PLAYER.isCP = DarkRP.stub{
    name = "isCP",
    description = "Whether this player is part of the police force (mayor, cp, chief).",
    parameters = {
    },
    returns = {
        {
            name = "answer",
            description = "Whether this player is part of the police force.",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.PLAYER.isMayor = DarkRP.stub{
    name = "isMayor",
    description = "Whether this player is a mayor.",
    parameters = {
    },
    returns = {
        {
            name = "answer",
            description = "Whether this player is a mayor.",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.PLAYER.isChief = DarkRP.stub{
    name = "isChief",
    description = "Whether this player is a Chief.",
    parameters = {
    },
    returns = {
        {
            name = "answer",
            description = "Whether this player is a Chief.",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}
