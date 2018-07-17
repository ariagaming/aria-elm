module Main exposing (..)

import Html exposing (Html, Attribute, text, div, h1, img, input, label)
import Html.Attributes exposing (class, attribute, src)
import Html.Events exposing (onInput)
import Defaults exposing (defaultCharacter)
import Models exposing (..)
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
import Views.Weapons exposing (renderWeapons)
import Views.Specials exposing (renderSpecials)
import Update exposing (update)


---- MODEL ----


init : ( Model, Cmd Msg )
init =
    ( { character = defaultCharacter
      , message = Nothing
      }
    , Cmd.none
    )



---- VIEW ----


formField : String -> (String -> Msg) -> Html Msg
formField l m =
    div []
        [ input [ onInput m ] []
        , label [] [ text l ]
        ]


view : Model -> Html Msg
view { character, message } =
    let
        (Character c) =
            character
    in
        div [ class "page-container" ]
            [ div [ class "page", attribute "data-size" "A4" ]
                [ renderCharacterInfo character
                , renderStatistics c.statistics
                , renderFeatures c.features
                , renderLanguages c.languages
                , renderResistances c.resistances
                , renderSkills c.skills
                , renderProfessions c.professions
                , img [ class "sword", src "/assets/sword.png" ] []
                , renderSecondaryStatistics (Character c)
                , renderEquipment c.armors
                , renderCombatStatistics (Character c)
                , renderWeapons c.weapons
                , renderSpecials (Specials [])
                ]
            , div [ class "page", attribute "data-size" "A4" ] []
            , div [ class "page", attribute "data-size" "A4" ] []
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
