local plyMeta = FindMetaTable("Player")

DarkRP.declareChatCommand{
    command = "job",
    description = "Change your job name",
    delay = 1.5,
    condition = fn.Compose{fn.Not, plyMeta.isArrested}
}

DarkRP.declareChatCommand{
    command = "teamban",
    description = "Ban someone from getting a certain job",
    delay = 1.5,
    tableArgs = true
}

DarkRP.declareChatCommand{
    command = "teamunban",
    description = "Undo a teamban",
    delay = 1.5,
    tableArgs = true
}
