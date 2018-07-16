module Views.Resistance exposing (..)

import Html exposing (Html, Attribute, text, div, span, img, input, label)
import Html.Attributes exposing (class, style)
import Models exposing (..)
import List exposing (map)
import Views.General exposing (content, boughtIndicator)


renderResistances : Resistances -> Html Msg
renderResistances (Resistances resistances) =
    div [ class "content-resistances" ]
        [ content "Resistance"
            (map
                (\(Resistance s) ->
                    div
                        [ class "content-row"
                        ]
                        [ span [ style [ ( "flex-basis", "20%" ) ] ]
                            [ boughtIndicator s.boughtFrom
                            , boughtIndicator s.expertiseFrom
                            ]
                        , span
                            [ style
                                [ ( "flex-basis", "20%" )
                                , ( "text-align", "center" )
                                ]
                            ]
                            [ text <| toString s.base ]
                        , span
                            [ style
                                [ ( "flex-basis", "60%" )
                                , ( "text-align", "left" )
                                ]
                            ]
                            [ text s.title ]
                        ]
                )
                resistances
            )
        ]
