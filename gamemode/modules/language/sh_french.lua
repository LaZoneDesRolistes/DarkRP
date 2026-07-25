--[[-----------------------------------------------------------------------
Textes du jeu, en français.

Ce serveur est francophone et n'embarque qu'une langue : la machinerie multilingue
de DarkRP a été retirée le 25/07/2026 (voir sh_language.lua).

Ce qui est à GAUCHE du signe égal est une clé : ne jamais la traduire, c'est ce que
le code appelle via DarkRP.getPhrase.

Les marqueurs %s, %d et %% sont remplis par string.format, qui est POSITIONNEL :
leur nombre et leur ORDRE doivent être identiques à ceux du code appelant. Inverser
deux %s dans une phrase inverse silencieusement deux valeurs à l'écran.
---------------------------------------------------------------------------]]

local phrases = {
    -- Administration
    need_admin = "Vous devez être administrateur pour %s",
    need_sadmin = "Vous devez être super-administrateur pour %s",
    no_privilege = "Vous n'avez pas les droits nécessaires pour cette action",
    invalid_x = "%s invalide ! %s",


    -- Argent
    price = "Prix : %s%d",
    reset_money = "%s a remis à zéro l'argent de tous les joueurs !",
    has_given = "%s vous a donné %s",
    you_gave = "Vous avez donné %s à %s",
    npc_killpay = "%s pour avoir tué un PNJ !",


    deducted_money = "%s prélevés",
    need_money = "Il vous manque %s",

    payday_message = "Jour de paie ! Vous avez reçu %s !",
    payday_unemployed = "Vous n'avez touché aucun salaire : vous êtes sans emploi !",
    payday_missed = "Jour de paie manqué ! (vous êtes en détention)",

    taxday = "Jour d'imposition ! %s%% de vos revenus ont été prélevés !",

    found_cheque = "Vous avez trouvé un chèque de %s%s émis à votre nom par %s.",
    cheque_details = "Ce chèque est émis à l'ordre de %s.",
    cheque_torn = "Vous avez déchiré le chèque.",
    cheque_pay = "Payer : %s",
    signed = "Signé : %s",

    found_money = "Vous avez ramassé %s !",

    -- Police
    wanted = "Recherché par la police !\nMotif : %s",
    warrant_required = "Il vous faut un mandat pour ouvrir cette porte.",
    warrant_required_unfreeze = "Il vous faut un mandat pour dégeler cet objet.",
    warrant_required_unweld = "Il vous faut un mandat pour désouder cet objet.",

    -- Joueurs
    health = "Santé : %s",
    job = "Métier : %s",
    salary = "Salaire : %s%s",
    wallet = "Portefeuille : %s%s",
    weapon = "Arme : %s",
    kills = "Éliminations : %s",
    deaths = "Morts : %s",
    rpname_changed = "%s a changé son nom RP en : %s",
    disconnected_player = "Joueur déconnecté",
    player = "joueur",



    -- Clés, véhicules et portes
    keys_other_allowed = "Autorisés en copropriété :",
    keys_allow_ownership = "(Rechargez avec les clés ou appuyez sur F2 pour rendre appropriable)",
    keys_disallow_ownership = "(Rechargez avec les clés ou appuyez sur F2 pour rendre inappropriable)",
    keys_owned_by = "Propriété de :",
    keys_unowned = "Sans propriétaire\n(Rechargez avec les clés ou appuyez sur F2 pour acquérir)",
    door_unown_arrested = "Vous ne pouvez rien acquérir ni céder en détention !",
    door_unownable = "Cette porte ne peut être ni acquise ni cédée !",
    door_sold = "Vous avez vendu ce bien pour %s",
    door_already_owned = "Cette porte appartient déjà à quelqu'un !",
    door_cannot_afford = "Vous n'avez pas les moyens d'acheter cette porte !",
    vehicle_cannot_afford = "Vous n'avez pas les moyens d'acheter ce véhicule !",
    door_bought = "Vous avez acheté cette porte pour %s%s",
    vehicle_bought = "Vous avez acheté ce véhicule pour %s%s",
    door_rem_owners_unownable = "Impossible de retirer un propriétaire sur une porte inappropriable !",
    door_add_owners_unownable = "Impossible d'ajouter un propriétaire sur une porte inappropriable !",
    rp_addowner_already_owns_door = "%s possède déjà cette porte (ou est déjà autorisé à la posséder) !",
    add_owner = "Ajouter un propriétaire",
    remove_owner = "Retirer un propriétaire",
    allow_ownership = "Rendre appropriable",
    disallow_ownership = "Rendre inappropriable",
    edit_door_group = "Modifier le groupe de portes",
    door_groups = "Groupes de portes",
    door_group_doesnt_exist = "Ce groupe de portes n'existe pas !",
    door_group_set = "Groupe de portes défini.",
    sold_x_doors = "Vous avez vendu %d portes pour %s !",
    no_doors_owned = "Vous ne possédez aucune porte !",


    sign_this_letter = "Signer cette lettre",
    signed_yours = "Cordialement,",

    amount = "Montant : ",

    picking_lock = "Crochetage en cours",

    bonus_destroying_entity = "la destruction de cette installation illégale.",

    switched_burst = "Passage en tir par rafales.",
    switched_fully_auto = "Passage en tir automatique.",
    switched_semi_auto = "Passage en tir semi-automatique.",

    keypad_checker_shoot_keypad = "Visez un digicode pour voir ce qu'il commande.",
    keypad_checker_shoot_entity = "Visez une entité pour voir quels digicodes la commandent",
    keypad_checker_click_to_clear = "Clic droit pour effacer.",
    keypad_checker_entering_right_pass = "Saisie du bon code",
    keypad_checker_entering_wrong_pass = "Saisie d'un code erroné",
    keypad_checker_after_right_pass = "après la saisie du bon code",
    keypad_checker_after_wrong_pass = "après la saisie d'un code erroné",
    keypad_checker_right_pass_entered = "Bon code saisi",
    keypad_checker_wrong_pass_entered = "Code erroné saisi",
    keypad_checker_controls_x_entities = "Ce digicode commande %d entités",
    keypad_checker_controlled_by_x_keypads = "Cette entité est commandée par %d digicodes",
    keypad_on = "ACTIF",
    keypad_off = "INACTIF",
    seconds = "secondes",

    persons_weapons = "Armes de %s :",
    returned_persons_weapons = "Armes confisquées rendues à %s.",
    no_weapons_confiscated = "Aucune arme n'avait été confisquée à %s !",
    no_illegal_weapons = "%s n'avait aucune arme.",
    confiscated_these_weapons = "Armes confisquées :",
    checking_weapons = "Confiscation des armes",

    createshipment = "Créer une cargaison",

    -- Communication
    hear_noone = "Personne ne peut vous entendre %s !",
    hear_everyone = "Tout le monde peut vous entendre !",
    hear_certain_persons = "Joueurs qui peuvent vous entendre %s : ",

    whisper = "chuchoter",
    yell = "crier",
    broadcast = "[Annonce !]",
    radio = "radio",
    group = "(groupe)",
    ooc = "HRP",
    radio_x = "Radio %d",

    talk = "parler",
    speak = "parler",

    speak_in_ooc = "parler en HRP",
    perform_your_action = "décrire votre action",
    talk_to_your_group = "parler à votre groupe",

    channel_set_to_x = "Canal réglé sur %s !",
    channel = "canal",

    -- Notifications
    disabled = "%s a été désactivé ! %s",
    gm_spawnvehicle = "faire apparaître des véhicules",
    gm_spawnsent = "faire apparaître des entités scriptées (SENT)",
    gm_spawnnpc = "faire apparaître des personnages non-joueurs (PNJ)",
    see_settings = "Consultez la configuration de DarkRP.",
    limit = "Vous avez atteint la limite de %s !",
    have_to_wait = "Vous devez encore attendre %d secondes avant d'utiliser %s !",
    must_be_looking_at = "Vous devez regarder un(e) %s !",
    incorrect_job = "Votre métier ne vous permet pas de %s",
    unable = "Vous ne pouvez pas %s. %s",
    cant_afford = "Vous n'avez pas les moyens pour ce(tte) %s",
    created_x = "%s a créé un(e) %s",
    cleaned_up = "Vos %s ont été nettoyés.",
    you_bought = "Vous avez acheté %s pour %s.",
    you_got_yourself = "Vous avez obtenu un(e) %s.",
    you_received_x = "Vous avez reçu %s pour %s.",

    do_not_own_ent = "Cette entité ne vous appartient pas !",
    cannot_drop_weapon = "Cette arme ne peut pas être lâchée !",

    -- Divers
    unknown = "Inconnu",
    arguments = "arguments",
    no_one = "personne",
    door = "porte",
    vehicle = "véhicule",
    door_or_vehicle = "porte/véhicule",
    driver = "Conducteur : %s",
    name = "Nom : %s",
    locked = "Verrouillé.",
    unlocked = "Déverrouillé.",
    job_doesnt_exist = "Ce métier n'existe pas !",
    must_be_alive_to_do_x = "Vous devez être en vie pour %s.",
    wait_with_that = "Patientez avant de refaire cela.",
    could_not_find = "Impossible de trouver %s",
    agenda = "agenda",
    frozen = "Gelé.",
    recipient = "destinataire",
    forbidden_name = "Nom interdit.",
    illegal_characters = "Caractères non autorisés.",
    too_long = "Trop long.",
    too_short = "Trop court.",

    dead_in_jail = "Vous resterez mort jusqu'à la fin de votre peine !",
    died_in_jail = "%s est mort en détention !",

    credits_for = "CRÉDITS DE %s\n",
    credits_see_console = "Crédits de DarkRP affichés dans la console.",

    rp_getvehicles = "Véhicules disponibles pour les véhicules personnalisés :",

    data_not_loaded_one = "Vos données ne sont pas encore chargées. Veuillez patienter.",
    data_not_loaded_two = "Si cela persiste, reconnectez-vous ou contactez un administrateur.",

    cant_spawn_weapons = "Vous ne pouvez pas faire apparaître d'armes.",
    drive_disabled = "Le pilotage est désactivé pour le moment.",
    property_disabled = "Cette propriété est désactivée pour le moment.",

    not_allowed_to_purchase = "Vous n'êtes pas autorisé à acheter cet article.",


    you_set_x_money = "Vous avez réglé l'argent de %s sur %s.",
    x_set_your_money = "%s a réglé votre argent sur %s.",
    you_set_x_name = "Vous avez changé le nom de %s en %s",
    x_set_your_name = "%s a changé votre nom en %s",

    someone_stole_steam_name = "Quelqu'un utilise déjà votre pseudo Steam comme nom RP : un « 1 » a été ajouté au vôtre.",
    already_taken = "Déjà pris.",

    cmd_cant_be_run_server_console = "Cette commande ne peut pas être lancée depuis la console du serveur.",

    -- Interface, portes et véhicules
    vote = "Voter",
    time = "Temps : %d",
    no = "Non",
    ok = "D'accord",
    cancel = "Annuler",
    add = "Ajouter",
    remove = "Retirer",
    none = "Aucun",

    x_options = "Options : %s",
    sell_x = "Vendre %s",
    set_x_title = "Définir le titre : %s",
    set_x_title_long = "Définir le titre du/de la %s que vous regardez.",
    jobs = "Métiers",
    buy_x = "Acheter %s",

    ammo = "munitions",
    shipment = "cargaison",
    shipments = "cargaisons",


    noone_available = "Personne de disponible",



    -- Onglet des armes sous licence
    license_tab = [[Armes sous licence

    Cochez les armes que les joueurs peuvent obtenir SANS licence !
    ]],
}

DarkRP.addLanguage("fr", phrases)
