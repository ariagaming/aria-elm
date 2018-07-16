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
                , renderSkills c.skills
                , renderFeatures c.features
                ]
            , div [ class "secondary-statistics" ]
                [ contentStatic { title = "hp", value = "21", prefix = "+", postfix = "%" }
                , contentStatic { title = "hp", value = "21", prefix = "+", postfix = "%" }
                , contentStatic { title = "hp", value = "21", prefix = "+", postfix = "%" }
                , contentStatic { title = "hp", value = "21", prefix = "+", postfix = "%" }
                , contentStatic { title = "hp", value = "21", prefix = "+", postfix = "%" }
                , contentStatic { title = "hp", value = "21", prefix = "+", postfix = "%" }
                , contentStatic { title = "hp", value = "21", prefix = "+", postfix = "%" }
                , contentStatic { title = "hp", value = "21", prefix = "+", postfix = "%" }
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
