module Models exposing (..)

import Dict exposing (Dict)


{- The message type being passed to the update function -}


type alias Name =
    String


type Msg
    = NoOp
    | BuySkill Source Name
    | Edit String
    | ToggleDialog Dialogs
    | ChangeMessage String


type alias Model =
    { character : Character
    , message : Maybe String
    , dialogs :
        { weapons : Bool
        , resistances : Bool
        , skills : Bool
        , features : Bool
        , professions : Bool
        , languages : Bool
        , specials : Bool
        , equipment : Bool
        , raceDialog : Bool
        }
    }


type Dialogs
    = WeaponsDialog
    | ResistancesDialog
    | ProfessionsDialog
    | SkillsDialog
    | FeaturesDialog
    | SpecialsDialog
    | LanguagesDialog
    | EquipmentDialog
    | RacialPackageDialog
    | NoDialog


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


type ArmorLocation
    = Face
    | Head
    | Neck
    | Shoulders
    | Body
    | Torso
    | Arms
    | Hands
    | Legs
    | RingLeft
    | RingRight
    | Waist
    | Feet


type Skill
    = Skill
        { name : Name
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


type WeaponType
    = Ranged
    | Melee
    | Magic


type Weapon
    = Weapon
        { name : String
        , description : Maybe String
        , numberOfDice : Int
        , diceSides : Int
        , constant : Int
        , attributes : Dict String String
        }


type Weapons
    = Weapons (List Weapon)


type Resistance
    = Resistance
        { name : String
        , title : String
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


type Resistances
    = Resistances (List Resistance)


type alias DefaultModel =
    { name : String
    , title : String
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


type Language
    = Language DefaultModel


type Languages
    = Languages (List Language)


type Profession
    = Profession DefaultModel


type Professions
    = Professions (List Profession)


type Armor
    = Armor
        { name : String
        , description : String
        , location : ArmorLocation
        , str : Int
        , agi : Int
        , inu : Int
        , per : Int
        , feats : List ( String, Int )
        , resistances : List ( String, Int )
        , skills : List ( String, Int )
        , professions : List ( String, Int )
        }


type Armors
    = Armors (List Armor)


type alias XP =
    Int


type Character
    = Character
        { name : String
        , statistics : Statistics
        , skills : Skills
        , features : Features
        , resistances : Resistances
        , languages : Languages
        , professions : Professions
        , armors : Armors
        , weapons : Weapons
        , xp : Maybe XP
        }
