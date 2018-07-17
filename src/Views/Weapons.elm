module Views.Weapons exposing (..)

import Html exposing (Html, Attribute, text, div, span, img, input, label)
import Html.Attributes exposing (class, style)
import Models exposing (..)
import List exposing (map)
import Views.General exposing (content, boughtIndicator)


renderWeapons : Weapons -> Html Msg
renderWeapons (Weapons weapons) =
    div [ class "content-weapons" ]
        [ content "Weapons"
            (map
                (\(Weapon s) ->
                    div
                        [ class "content-row"
                        ]
                        [ div [] [ text "alsdjkasd" ]
                        ]
                )
                weapons
            )
            (Just WeaponsDialog)
        ]
