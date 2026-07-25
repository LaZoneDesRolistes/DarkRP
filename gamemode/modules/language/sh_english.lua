--[[-----------------------------------------------------------------------
English (example) language file
---------------------------------------------------------------------------

This is the english language file. The things on the left side of the equals sign are the things you should leave alone
The parts between the quotes are the parts you should translate. You can also copy this file and create a new language.

= Warning =
Sometimes when DarkRP is updated, new phrases are added.
If you don't translate these phrases to your language, it will use the English sentence.
To fix this, join your server, open your console and enter darkp_getphrases yourlanguage
For English the command would be:
    darkrp_getphrases "en"
because "en" is the language code for English.

You can copy the missing phrases to this file and translate them.

= Note =
Make sure the language code is right at the bottom of this file

= Using a language =
Make sure the convar gmod_language is set to your language code. You can do that in a server CFG file.
---------------------------------------------------------------------------]]

local my_language = {
    -- Admin things
    need_admin = "You need admin privileges in order to be able to %s",
    need_sadmin = "You need super admin privileges in order to be able to %s",
    no_privilege = "You don't have the right privileges to perform this action",
    invalid_x = "Invalid %s! %s",


    -- Money things:
    price = "Price: %s%d",
    reset_money = "%s has reset all players' money!",
    has_given = "%s has given you %s",
    you_gave = "You gave %s %s",
    npc_killpay = "%s for killing an NPC!",


    deducted_money = "Deducted %s",
    need_money = "Need %s",

    payday_message = "Payday! You received %s!",
    payday_unemployed = "You received no salary because you are unemployed!",
    payday_missed = "Pay day missed! (You're Arrested)",

    taxday = "Tax Day! %s%% of your income was taken!",

    found_cheque = "You have found %s%s in a cheque made out to you from %s.",
    cheque_details = "This cheque is made out to %s.",
    cheque_torn = "You have torn up the cheque.",
    cheque_pay = "Pay: %s",
    signed = "Signed: %s",

    found_money = "You have picked up %s!",

    -- Police
    wanted = "Wanted by Police!\nReason: %s",
    warrant_required = "You need a warrant in order to be able to open this door.",
    warrant_required_unfreeze = "You need a warrant in order to be able to unfreeze this prop.",
    warrant_required_unweld = "You need a warrant in order to be able to unweld this prop.",

    -- Players
    health = "Health: %s",
    job = "Job: %s",
    salary = "Salary: %s%s",
    wallet = "Wallet: %s%s",
    weapon = "Weapon: %s",
    kills = "Kills: %s",
    deaths = "Deaths: %s",
    rpname_changed = "%s changed their RPName to: %s",
    disconnected_player = "Disconnected player",
    player = "player",



    -- Keys, vehicles and doors
    keys_other_allowed = "Allowed to co-own:",
    keys_allow_ownership = "(Press Reload with keys or press F2 to allow ownership)",
    keys_disallow_ownership = "(Press Reload with keys or press F2 to disallow ownership)",
    keys_owned_by = "Owned by:",
    keys_unowned = "Unowned\n(Press Reload with keys or press F2 to own)",
    door_unown_arrested = "You can not own or unown things while arrested!",
    door_unownable = "This door cannot be owned or unowned!",
    door_sold = "You have sold this for %s",
    door_already_owned = "This door is already owned by someone!",
    door_cannot_afford = "You can not afford this door!",
    vehicle_cannot_afford = "You can not afford this vehicle!",
    door_bought = "You've bought this door for %s%s",
    vehicle_bought = "You've bought this vehicle for %s%s",
    door_rem_owners_unownable = "You can not remove owners if a door is non-ownable!",
    door_add_owners_unownable = "You can not add owners if a door is non-ownable!",
    rp_addowner_already_owns_door = "%s already owns (or is already allowed to own) this door!",
    add_owner = "Add owner",
    remove_owner = "Remove owner",
    allow_ownership = "Allow ownership",
    disallow_ownership = "Disallow ownership",
    edit_door_group = "Edit door group",
    door_groups = "Door groups",
    door_group_doesnt_exist = "Door group does not exist!",
    door_group_set = "Door group set successfully.",
    sold_x_doors = "You have sold %d doors for %s!",
    no_doors_owned = "You don't own any doors!",


    sign_this_letter = "Sign this letter",
    signed_yours = "Yours,",

    amount = "Amount: ",

    picking_lock = "Picking lock",

    bonus_destroying_entity = "destroying this illegal entity.",

    switched_burst = "Switched to burst-fire mode.",
    switched_fully_auto = "Switched to fully automatic fire mode.",
    switched_semi_auto = "Switched to semi-automatic fire mode.",

    keypad_checker_shoot_keypad = "Shoot a keypad to see what it controls.",
    keypad_checker_shoot_entity = "Shoot an entity to see which keypads are connected to it",
    keypad_checker_click_to_clear = "Right click to clear.",
    keypad_checker_entering_right_pass = "Entering the right password",
    keypad_checker_entering_wrong_pass = "Entering the wrong password",
    keypad_checker_after_right_pass = "after having entered the right password",
    keypad_checker_after_wrong_pass = "after having entered the wrong password",
    keypad_checker_right_pass_entered = "Right password entered",
    keypad_checker_wrong_pass_entered = "Wrong password entered",
    keypad_checker_controls_x_entities = "This keypad controls %d entities",
    keypad_checker_controlled_by_x_keypads = "This entity is controlled by %d keypads",
    keypad_on = "ON",
    keypad_off = "OFF",
    seconds = "seconds",

    persons_weapons = "%s's weapons:",
    returned_persons_weapons = "Returned %s's confiscated weapons.",
    no_weapons_confiscated = "%s had no weapons confiscated!",
    no_illegal_weapons = "%s had no weapons.",
    confiscated_these_weapons = "Confiscated these weapons:",
    checking_weapons = "Confiscating weapons",

    createshipment = "Create a shipment",

    -- Talking
    hear_noone = "No-one can hear you %s!",
    hear_everyone = "Everyone can hear you!",
    hear_certain_persons = "Players who can hear you %s: ",

    whisper = "whisper",
    yell = "yell",
    broadcast = "[Broadcast!]",
    radio = "radio",
    group = "(group)",
    ooc = "OOC",
    radio_x = "Radio %d",

    talk = "talk",
    speak = "speak",

    speak_in_ooc = "speak in OOC",
    perform_your_action = "perform your action",
    talk_to_your_group = "talk to your group",

    channel_set_to_x = "Channel set to %s!",
    channel = "channel",

    -- Notifies
    disabled = "%s has been disabled! %s",
    gm_spawnvehicle = "spawn vehicles",
    gm_spawnsent = "spawn scripted entities (SENTs)",
    gm_spawnnpc = "spawn Non-Player Characters (NPCs)",
    see_settings = "Please see the DarkRP settings.",
    limit = "You have reached the %s limit!",
    have_to_wait = "You need to wait another %d seconds before using %s!",
    must_be_looking_at = "You need to be looking at a %s!",
    incorrect_job = "You do not have the right job to %s",
    unable = "You are unable to %s. %s",
    cant_afford = "You cannot afford this %s",
    created_x = "%s created a %s",
    cleaned_up = "Your %s were cleaned up.",
    you_bought = "You have bought %s for %s.",
    you_got_yourself = "You got yourself a %s.",
    you_received_x = "You have received %s for %s.",

    do_not_own_ent = "You do not own this entity!",
    cannot_drop_weapon = "Can't drop this weapon!",

    -- Misc
    unknown = "Unknown",
    arguments = "arguments",
    no_one = "no one",
    door = "door",
    vehicle = "vehicle",
    door_or_vehicle = "door/vehicle",
    driver = "Driver: %s",
    name = "Name: %s",
    locked = "Locked.",
    unlocked = "Unlocked.",
    job_doesnt_exist = "Job does not exist!",
    must_be_alive_to_do_x = "You must be alive in order to %s.",
    wait_with_that = "Wait with that.",
    could_not_find = "Could not find %s",
    agenda = "agenda",
    frozen = "Frozen.",
    recipient = "recipient",
    forbidden_name = "Forbidden name.",
    illegal_characters = "Illegal characters.",
    too_long = "Too long.",
    too_short = "Too short.",

    dead_in_jail = "You now are dead until your jail time is up!",
    died_in_jail = "%s has died in jail!",

    credits_for = "CREDITS FOR %s\n",
    credits_see_console = "DarkRP credits printed to console.",

    rp_getvehicles = "Available vehicles for custom vehicles:",

    data_not_loaded_one = "Your data has not been loaded yet. Please wait.",
    data_not_loaded_two = "If this persists, try rejoining or contacting an admin.",

    cant_spawn_weapons = "You cannot spawn weapons.",
    drive_disabled = "Drive disabled for now.",
    property_disabled = "Property disabled for now.",

    not_allowed_to_purchase = "You are not allowed to purchase this item.",


    you_set_x_money = "You set %s's money to %s.",
    x_set_your_money = "%s set your money to %s.",
    you_set_x_name = "You set %s's name to %s",
    x_set_your_name = "%s set your name to %s",

    someone_stole_steam_name = "Someone is already using your Steam name as their RP name so we gave you a '1' after your name.", -- Uh oh
    already_taken = "Already taken.",

    cmd_cant_be_run_server_console = "This command cannot be run from the server console.",

    -- VGUI and some more doors/vehicles
    vote = "Vote",
    time = "Time: %d",
    no = "No",
    ok = "Okay",
    cancel = "Cancel",
    add = "Add",
    remove = "Remove",
    none = "None",

    x_options = "%s options",
    sell_x = "Sell %s",
    set_x_title = "Set %s title",
    set_x_title_long = "Set the title of the %s you are looking at.",
    jobs = "Jobs",
    buy_x = "Buy %s",

    ammo = "ammo",
    shipment = "shipment",
    shipments = "shipments",


    noone_available = "No one available",



    -- Licenseweaponstab
    license_tab = [[License weapons

    Tick the weapons people should be able to get WITHOUT a license!
    ]],
}

-- The language code is usually (but not always) a two-letter code. The default language is "en".
-- Other examples are "nl" (Dutch), "de" (German)
-- If you want to know what your language code is, open GMod, select a language at the bottom right
-- then enter gmod_language in console. It will show you the code.
-- Make sure language code is a valid entry for the convar gmod_language.
DarkRP.addLanguage("en", my_language)
