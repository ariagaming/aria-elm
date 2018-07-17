module Views.Languages exposing (..)

import Html exposing (Html, Attribute, text, div, span, img, input, label)
import Html.Attributes exposing (class, style)
import Models exposing (..)
import List exposing (map)
import Views.General exposing (content, boughtIndicator)
import Maybe exposing (Maybe(..))


renderLanguages : Languages -> Html Msg
renderLanguages (Languages languages) =
    div [ class "content-languages" ]
        [ content "Languages"
            (map
                (\(Language s) ->
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
                languages
            )
            Nothing
        ]
