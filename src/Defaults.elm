module Defaults exposing (..)

import Models exposing (..)


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


defaultCharacter : Character
defaultCharacter =
    Character
        { name = "Peter Pan"
        , statistics = Statistics statistics
        , features = Features features
        , skills = Skills skills
        }


character : Character
character =
    defaultCharacter



-- # buy "Acrobatics" BuySkill
-- # buy "Rope use" BuySkill
