module Views.Specials exposing (..)

import Html exposing (Html, Attribute, text, div, span, img, input, label)
import Html.Attributes exposing (class, style)
import Models exposing (..)
import List exposing (map)
import Views.General exposing (content, boughtIndicator)


renderSpecials : Specials -> Html Msg
renderSpecials (Specials specials) =
    div [ class "content-specials" ]
        [ content "Specials"
            (map
                (\(Special s) ->
                    div
                        [ class "content-row"
                        ]
                        [ div [] [ text "alsdjkasd" ]
                        ]
                )
                specials
            )
            Nothing
        ]
