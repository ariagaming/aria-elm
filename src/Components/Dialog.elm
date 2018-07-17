module Components.Dialog exposing (..)

import Html exposing (Html, div, text, button)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Models exposing (..)


dialog : Bool -> String -> Dialogs -> Html Msg
dialog show title d =
    case show of
        True ->
            div [ class "dialog" ]
                [ div [ class "dialog-content" ]
                    [ div [ class "title" ] [ text title ]
                    , div [ class "footer" ]
                        [ button [ onClick (HideDialog d) ] [ text "Discard" ]
                        , button [] [ text "Accept" ]
                        ]
                    ]
                ]

        False ->
            div [ class "hidden-dialog" ] []
