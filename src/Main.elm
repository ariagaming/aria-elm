module Main exposing (..)

import Html exposing (Html, Attribute, text, div, h1, img, input, label)
import Html.Attributes exposing (class, attribute)
import Html.Events exposing (onInput)
import Defaults exposing (defaultCharacter)
import Models exposing (..)
import Views.General exposing (contentStatic)
import Views.Info exposing (renderCharacterInfo)
import Views.Skills exposing (renderSkills)
import Views.Features exposing (renderFeatures)
import Views.Statistics exposing (renderStatistics)
import Views.Resistance exposing (renderResistances)
import Views.Languages exposing (renderLanguages)
import Views.Professions exposing (renderProfessions)
import Domain exposing (buySkill)
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
                ]
            , div [ class "secondary-statistics" ]
                [ contentStatic { title = "hp", value = "25", prefix = "", postfix = "" }
                , contentStatic { title = "ap", value = "12", prefix = "", postfix = "" }
                , contentStatic { title = "expertise", value = "1", prefix = "+", postfix = "" }
                , contentStatic { title = "movement", value = "12", prefix = "", postfix = "ft" }
                , contentStatic { title = "initiative", value = "0", prefix = "1", postfix = "" }
                , contentStatic { title = "armor", value = "0", prefix = "", postfix = "%" }
                , contentStatic { title = "aura", value = "5", prefix = "", postfix = "%" }
                , contentStatic { title = "ac", value = "0", prefix = "", postfix = "" }
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
