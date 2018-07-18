module Views.Weapons exposing (..)

import Html exposing (Html, Attribute, text, div, span, img, input, label)
import Html.Attributes exposing (class, style)
import Models exposing (..)
import List exposing (map, repeat)
import Views.General exposing (content, boughtIndicator)
import Components.Dialog exposing (dialog)


renderWeapons : Weapons -> Html Msg
renderWeapons (Weapons weapons) =
    div [ class "content-weapons" ]
        [ content "Weapons"
            (map
                (\(Weapon s) ->
                    div
                        [ class "content-row"
                        ]
                        [ div []
                            [ span [] [ text <| s.name ++ " " ]
                            , span [] [ text <| toString s.numberOfDice ]
                            , span [] [ text "d" ]
                            , span [] [ text <| toString s.diceSides ]
                            ]
                        ]
                )
                weapons
            )
            (Just WeaponsDialog)
        ]


weaponsList : Weapons -> Html Msg
weaponsList (Weapons weapons) =
    let
        w =
            repeat 50 { name = "Dagger" }
    in
        div
            []
            (map
                (\wp -> div [] [ span [] [ text wp.name ] ])
                w
            )


weaponsDialog : Bool -> Weapons -> Html Msg
weaponsDialog show weapons =
    dialog show
        "Weapons"
        WeaponsDialog
        (Just
            [ weaponsList weapons
            ]
        )
