module Main exposing (..)

import Html exposing (Html, Attribute, text, div, h1, img, input, label)
import Html.Attributes exposing (class, attribute, src)
import Html.Events exposing (onInput)
import Defaults exposing (defaultCharacter)
import Models exposing (..)
import Components.Dialog exposing (dialog)
import Views.General exposing (contentStatic)
import Views.Info exposing (renderCharacterInfo)
import Views.Skills exposing (renderSkills)
import Views.Features exposing (renderFeatures)
import Views.Statistics
    exposing
        ( renderStatistics
        , renderSecondaryStatistics
        , renderCombatStatistics
        )
import Views.Resistance exposing (renderResistances)
import Views.Languages exposing (renderLanguages)
import Views.Professions exposing (renderProfessions)
import Views.Equipment exposing (renderEquipment)
import Views.Weapons exposing (renderWeapons, weaponsDialog)
import Views.Specials exposing (renderSpecials)
import Views.RacialPackage exposing (raceDialog)
import Update exposing (update)


---- MODEL ----


init : ( Model, Cmd Msg )
init =
    ( { character = defaultCharacter
      , message = Nothing
      , dialogs =
            { weapons = False
            , resistances = False
            , skills = False
            , features = False
            , professions = False
            , languages = False
            , equipment = False
            , specials = False
            , raceDialog = False
            }
      }
    , Cmd.none
    )



---- VIEW ----


view : Model -> Html Msg
view { character, dialogs } =
    let
        (Character c) =
            character
    in
        div [ class "page-container" ]
            {-
               The main character sheet page
            -}
            [ div [ class "page", attribute "data-size" "A4" ]
                [ renderCharacterInfo character
                , renderStatistics c.statistics
                , renderFeatures c.features
                , renderLanguages c.languages
                , renderResistances c.resistances
                , renderSkills c.skills
                , renderProfessions c.professions
                , img [ class "sword", src "/assets/sword.png" ] []
                , renderSecondaryStatistics character
                , renderEquipment c.armors
                , renderCombatStatistics character
                , renderWeapons c.weapons
                , renderSpecials (Specials [])
                ]
            , div [ class "page", attribute "data-size" "A4" ] []
            , div [ class "page", attribute "data-size" "A4" ] []

            {-
               Dialogs
            -}
            , weaponsDialog dialogs.weapons c.weapons
            , dialog dialogs.resistances "Resistances" ResistancesDialog Nothing
            , dialog dialogs.skills "Skills" SkillsDialog Nothing
            , dialog dialogs.professions "Professions" ProfessionsDialog Nothing
            , dialog dialogs.features "Features" FeaturesDialog Nothing
            , dialog dialogs.languages "Languages" LanguagesDialog Nothing
            , dialog dialogs.specials "Specials" SpecialsDialog Nothing
            , dialog dialogs.equipment "Equipment" EquipmentDialog Nothing
            , raceDialog dialogs.raceDialog
            ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
