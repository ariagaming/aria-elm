module Models exposing (..)

{- The message type being passed to the update function -}


type Msg
    = NoOp
    | ChangeMessage String


type AttributeType
    = Magical
    | Physical
    | Mental


type Source
    = None
    | RacialPackage
    | ProfessionalPackage
    | XP
    | Gift


type StatisticType
    = Strength
    | Intuition
    | Perception
    | Agility


type Skill
    = Skill
        { name : String
        , title : String
        , attribute : AttributeType
        , stat : StatisticType
        , boughtFrom : Source
        , boughtXP : Int
        , expertiseFrom : Source
        , expertiseXP : Int
        , base : Int
        , race : Int
        , profession : Int
        , equipment : Int
        , bonus : Int
        , total : Int
        }


type Skills
    = Skills (List Skill)


type Special
    = Special
        { name : String
        }


type Specials
    = Specials (List Special)


type Feature
    = Feature
        { name : String
        , title : String
        , attribute : AttributeType
        , boughtFrom : Source
        , boughtXP : Int
        , expertiseFrom : Source
        , expertiseXP : Int
        , base : Int
        , race : Int
        , profession : Int
        , equipment : Int
        , bonus : Int
        , total : Int
        }


type Features
    = Features (List Feature)


type Statistic
    = Statistic
        { name : String
        , title : String
        , stat : StatisticType
        , base : Int
        , race : Int
        , profession : Int
        , equipment : Int
        , bonus : Int
        , total : Int
        }


type Statistics
    = Statistics (List Statistic)


type Weapon
    = Weapon
        { name : String
        }


type Weapons
    = Weapons (List Weapon)


type Resistance
    = Resistance
        { name : String
        }


type Resistances
    = Resistances (List Resistance)


type Character
    = Character
        { name : String
        , statistics : Statistics
        , skills : Skills
        , features : Features
        }