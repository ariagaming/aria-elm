module Views.Skills exposing (..)

import Html exposing (Html, Attribute, text, div, span, img, input, label)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import Models exposing (..)
import List exposing (map)
import Views.General exposing (content, boughtIndicator)


renderSkills : Skills -> Html Msg
renderSkills (Skills skills) =
    div [ class "content-skills" ]
        [ content "Skills"
            (map
                (\(Skill s) ->
                    div
                        [ class "content-row"
                        , onClick (BuySkill RacialPackage s.name)
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
                skills
            )
            (Just SkillsDialog)
        ]
