module Views.Features exposing (..)

import Html exposing (Html, Attribute, text, div, span, img, input, label)
import Html.Attributes exposing (class, style)
import Models exposing (..)
import List exposing (map)
import Views.General exposing (content, boughtIndicator)


renderFeatures : Features -> Html Msg
renderFeatures (Features features) =
    div [ class "content-feats" ]
        [ content "Features"
            (map
                (\(Feature s) ->
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
                features
            )
            (Just FeaturesDialog)
        ]
