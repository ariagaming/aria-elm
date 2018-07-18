module Components.Dialog exposing (..)

import Html exposing (Html, div, text, button)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Models exposing (..)
import Maybe exposing (withDefault)


dialog : Bool -> String -> Dialogs -> Maybe (List (Html Msg)) -> Html Msg
dialog show title d children =
    case show of
        True ->
            div [ class "dialog" ]
                [ div [ class "dialog-content" ]
                    [ div [ class "title" ] [ text title ]
                    , div [ class "inner-content" ] (withDefault [] children)
                    , div [ class "footer" ]
                        [ button [ onClick (ToggleDialog d) ] [ text "Discard" ]
                        , button [] [ text "Accept" ]
                        ]
                    ]
                ]

        False ->
            div [ class "hidden-dialog" ] []
