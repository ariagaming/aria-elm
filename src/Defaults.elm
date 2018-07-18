module Defaults exposing (..)

import Models exposing (..)
import Dict exposing (..)


{-
   This module implements defaults for the Models, because we're building
   a simple Pen and Paper character management system we'll try and keep the
   implementations and the data separate.
-}


makeFeature : { name : String, title : String, attribute : AttributeType } -> Feature
makeFeature { name, title, attribute } =
    Feature
        { boughtFrom = None
        , boughtXP = 0
        , expertiseFrom = None
        , expertiseXP = 0
        , base = 0
        , race = 0
        , profession = 0
        , equipment = 0
        , bonus = 0
        , total = 0
        , name = name
        , title = title
        , attribute = attribute
        }


features : List Feature
features =
    [ makeFeature { name = "Expertise", title = "Expertise", attribute = Mental }
    , makeFeature { name = "WS Expertise", title = "WS Expretise", attribute = Mental }
    , makeFeature { name = "BS Expertise", title = "BS Expertise", attribute = Mental }
    , makeFeature { name = "Def Expertise", title = "Def Expertise", attribute = Mental }
    , makeFeature { name = "Magic Expertise", title = "Magic Expertise", attribute = Mental }
    , makeFeature { name = "Dmg adjstm.", title = "Dmg adjstm.", attribute = Mental }
    , makeFeature { name = "Crit", title = "Crit", attribute = Mental }
    , makeFeature { name = "Crit DMG", title = "Crit DMG", attribute = Mental }
    , makeFeature { name = "Splash", title = "Splash", attribute = Mental }
    , makeFeature { name = "Splash DMG", title = "Splash DMG", attribute = Mental }
    , makeFeature { name = "Extra Attack", title = "Extra Attack", attribute = Mental }
    , makeFeature { name = "Toughness", title = "Toughness", attribute = Mental }
    , makeFeature { name = "Aura", title = "Aura", attribute = Mental }
    , makeFeature { name = "Stamina", title = "Stamina", attribute = Mental }
    , makeFeature { name = "Recuperate", title = "Recuperate", attribute = Mental }
    , makeFeature { name = "Break Armor", title = "Break Armor", attribute = Mental }
    , makeFeature { name = "Unbreakable", title = "Unbreakable", attribute = Mental }
    , makeFeature { name = "Movement", title = "Movement", attribute = Mental }
    , makeFeature { name = "Initiative", title = "Initiative", attribute = Mental }
    , makeFeature { name = "Directed Strike", title = "Directed Strike", attribute = Mental }
    ]


makeSkill : { name : String, title : String, attribute : AttributeType } -> Skill
makeSkill { name, title, attribute } =
    Skill
        { boughtFrom = None
        , boughtXP = 0
        , expertiseFrom = None
        , expertiseXP = 0
        , base = 0
        , race = 0
        , profession = 0
        , equipment = 0
        , bonus = 0
        , total = 0
        , name = name
        , title = title
        , attribute = attribute
        , stat = Strength
        }


skills : List Skill
skills =
    [ makeSkill { name = "Acrobatics", title = "Acrobatics", attribute = Physical }
    , makeSkill { name = "Animal Handler", title = "Animal Handler", attribute = Physical }
    , makeSkill { name = "Arcane Lore", title = "Arcane Lore", attribute = Magical }
    , makeSkill { name = "Herbalism", title = "Herbalism", attribute = Mental }
    , makeSkill { name = "History", title = "History", attribute = Mental }
    , makeSkill { name = "Politics", title = "Politics", attribute = Mental }
    , makeSkill { name = "Law", title = "Law", attribute = Mental }
    , makeSkill { name = "Math & Science", title = "Fishing", attribute = Mental }
    , makeSkill { name = "Medicine", title = "Medicine", attribute = Mental }
    , makeSkill { name = "Stealth", title = "Stealth", attribute = Physical }
    , makeSkill { name = "Investigate", title = "Investigate", attribute = Mental }
    , makeSkill { name = "Interrogate", title = "Interrogate", attribute = Mental }
    , makeSkill { name = "Presuasion", title = "Presuasion", attribute = Mental }
    , makeSkill { name = "Winderness Survival", title = "Winderness Surv.", attribute = Physical }
    , makeSkill { name = "Rope use", title = "Rope use", attribute = Physical }
    , makeSkill { name = "Defense", title = "Defense", attribute = Physical }
    , makeSkill { name = "Weapon Skill", title = "Weapon Skill", attribute = Physical }
    , makeSkill { name = "Ballistic Skill", title = "Ballistic Skill", attribute = Physical }
    , makeSkill { name = "Magic", title = "Magic", attribute = Physical }
    , makeSkill { name = "Religion", title = "Religion", attribute = Physical }
    ]


makeStat : { name : String, title : String, stat : StatisticType, base : Int } -> Statistic
makeStat { name, title, stat, base } =
    Statistic
        { base = base
        , race = 0
        , profession = 0
        , equipment = 0
        , bonus = 0
        , total = round (toFloat base / 10)
        , name = name
        , title = title
        , stat = stat
        }


statistics : List Statistic
statistics =
    [ makeStat { name = "Stength", title = "Stength", stat = Strength, base = 12 }
    , makeStat { name = "Agility", title = "Agility", stat = Agility, base = 30 }
    , makeStat { name = "Intuition", title = "Intuition", stat = Intuition, base = 1 }
    , makeStat { name = "Perception", title = "Perception", stat = Perception, base = 5 }
    ]


makeResistance : { name : String, title : String, stat : StatisticType } -> Resistance
makeResistance { name, title, stat } =
    Resistance
        { base = 0
        , race = 0
        , profession = 0
        , equipment = 0
        , bonus = 0
        , total = 0
        , name = name
        , title = title
        , stat = stat
        , boughtFrom = None
        , boughtXP = 0
        , expertiseFrom = None
        , expertiseXP = 0
        }


resistances : List Resistance
resistances =
    [ makeResistance { name = "Fire & Heat", title = "Fire & Heat", stat = Strength }
    , makeResistance { name = "Cold & Ice", title = "Cold & Ice", stat = Strength }
    , makeResistance { name = "Poison & Disease", title = "Poison & Disease", stat = Strength }
    , makeResistance { name = "Holy", title = "Holy", stat = Strength }
    , makeResistance { name = "Mental", title = "Mental", stat = Strength }
    , makeResistance { name = "Demonic", title = "Demonic", stat = Strength }
    , makeResistance { name = "Necromantic", title = "Necromantic", stat = Strength }
    ]


makeLanguage : { name : String, title : String } -> DefaultModel
makeLanguage { name, title } =
    { base = 0
    , race = 0
    , profession = 0
    , equipment = 0
    , bonus = 0
    , total = 0
    , name = name
    , title = title
    , boughtFrom = None
    , boughtXP = 0
    , expertiseFrom = None
    , expertiseXP = 0
    }


languages : List Language
languages =
    [ Language <| makeLanguage { name = "Common", title = "Common" }
    ]


professions : List Profession
professions =
    [ Profession <| makeLanguage { name = "Merchant", title = "Merchant" }
    , Profession <| makeLanguage { name = "Merchant", title = "Sailor" }
    , Profession <| makeLanguage { name = "Merchant", title = "Armorer" }
    , Profession <| makeLanguage { name = "Merchant", title = "Medic" }
    , Profession <| makeLanguage { name = "Merchant", title = "Lawyer" }
    , Profession <| makeLanguage { name = "Merchant", title = "Agent" }
    , Profession <| makeLanguage { name = "Merchant", title = "Stagehand" }
    , Profession <| makeLanguage { name = "Merchant", title = "Miner" }
    , Profession <| makeLanguage { name = "Merchant", title = "Researcher" }
    , Profession <| makeLanguage { name = "Merchant", title = "Apothecary" }
    ]


makeArmor : { location : ArmorLocation } -> Armor
makeArmor { location } =
    Armor
        { name = ""
        , description = ""
        , location = location
        , str = 0
        , agi = 0
        , inu = 0
        , per = 0
        , feats = []
        , resistances = []
        , skills = []
        , professions = []
        }


armors : List Armor
armors =
    [ makeArmor { location = Face }
    , makeArmor { location = Head }
    , makeArmor { location = Neck }
    , makeArmor { location = Shoulders }
    , makeArmor { location = Body }
    , makeArmor { location = Torso }
    , makeArmor { location = Arms }
    , makeArmor { location = Hands }
    , makeArmor { location = Legs }
    , makeArmor { location = RingLeft }
    , makeArmor { location = RingRight }
    , makeArmor { location = Waist }
    , makeArmor { location = Feet }
    ]


weapons : List Weapon
weapons =
    [ Weapon
        { name = "Dagger"
        , description = Nothing
        , numberOfDice = 1
        , diceSides = 4
        , constant = 0
        , attributes = Dict.fromList []
        }
    ]


defaultCharacter : Character
defaultCharacter =
    Character
        { name = "Peter Pan"
        , statistics = Statistics statistics
        , features = Features features
        , skills = Skills skills
        , resistances = Resistances resistances
        , languages = Languages languages
        , professions = Professions professions
        , armors = Armors armors
        , weapons = Weapons weapons
        , xp = Just 20
        }


character : Character
character =
    defaultCharacter



-- # buy "Acrobatics" BuySkill
-- # buy "Rope use" BuySkill
