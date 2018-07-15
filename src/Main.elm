module Main exposing (..)

import Html exposing (Html, Attribute, text, div, h1, img, input, label)
import Html.Attributes exposing (class, attribute)
import Html.Events exposing (onInput)
import Defaults exposing (defaultCharacter)
import Models exposing (..)
import Views.Skills exposing (renderSkills)


---- MODEL ----


type alias Model =
    { character : Character
    , message : Maybe String
    }


init : ( Model, Cmd Msg )
init =
    ( { character = defaultCharacter
      , message = Nothing
      }
    , Cmd.none
    )



---- UPDATE ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeMessage s ->
            case s of
                "" ->
                    ( { model | message = Nothing }, Cmd.none )

                _ ->
                    ( { model | message = Just s }, Cmd.none )

        _ ->
            ( model, Cmd.none )



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
                [ h1 []
                    [ text c.name
                    ]
                , renderSkills c.skills
                , formField "something" ChangeMessage
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
