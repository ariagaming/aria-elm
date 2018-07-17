module Views.Statistics exposing (..)

import Html exposing (Html, Attribute, text, div, span, img, input, label)
import Html.Attributes exposing (class, style, src)
import Views.General exposing (contentStatic)
import Models exposing (..)
import Maybe exposing (Maybe(Just, Nothing), andThen, withDefault)


find : (a -> Bool) -> List a -> Maybe a
find predicate list =
    case list of
        [] ->
            Nothing

        first :: rest ->
            if predicate first then
                Just first
            else
                find predicate rest


renderStatistics : Statistics -> Html Msg
renderStatistics (Statistics statistics) =
    let
        findStatistic2 statType =
            find (\(Statistic s) -> s.stat == statType) statistics
                |> andThen (\(Statistic s) -> Just { base = s.base, total = s.total })
                |> withDefault { base = 0, total = 0 }

        findStatistic : StatisticType -> { base : Int, total : Int }
        findStatistic statisticType =
            case find (\(Statistic s) -> s.stat == statisticType) statistics of
                Nothing ->
                    { base = 0, total = 0 }

                Just stat ->
                    let
                        (Statistic str) =
                            stat
                    in
                        { base = str.base, total = str.total }

        str =
            findStatistic2 Strength

        inu =
            findStatistic Intuition

        agi =
            findStatistic Agility

        per =
            findStatistic Perception
    in
        div [ class "character-statistics" ]
            [ img [ src "/assets/statistics-container.png" ] []
            , div [ class "character-statistic str" ]
                [ div [ class "total" ]
                    [ text <| toString str.total ]
                , div
                    [ class "calculated" ]
                    [ text <| toString str.base ]
                ]
            , div [ class "character-statistic agi" ]
                [ div [ class "total" ]
                    [ text <| toString agi.total ]
                , div
                    [ class "calculated" ]
                    [ text <| toString agi.base ]
                ]
            , div [ class "character-statistic inu" ]
                [ div [ class "total" ]
                    [ text <| toString inu.total ]
                , div
                    [ class "calculated" ]
                    [ text <| toString inu.base ]
                ]
            , div [ class "character-statistic per" ]
                [ div [ class "total" ]
                    [ text <| toString per.total ]
                , div
                    [ class "calculated" ]
                    [ text <| toString per.base ]
                ]
            ]


renderSecondaryStatistics : Character -> Html Msg
renderSecondaryStatistics (Character c) =
    div
        [ class "secondary-statistics" ]
        [ contentStatic { title = "hp", value = "25", prefix = "", postfix = "" }
        , contentStatic { title = "ap", value = "12", prefix = "", postfix = "" }
        , contentStatic { title = "expertise", value = "1", prefix = "+", postfix = "" }
        , contentStatic { title = "movement", value = "12", prefix = "", postfix = "ft" }
        , contentStatic { title = "initiative", value = "0", prefix = "1", postfix = "" }
        , contentStatic { title = "armor", value = "0", prefix = "", postfix = "%" }
        , contentStatic { title = "aura", value = "5", prefix = "", postfix = "%" }
        , contentStatic { title = "ac", value = "0", prefix = "", postfix = "" }
        ]


renderCombatStatistics : Character -> Html Msg
renderCombatStatistics (Character c) =
    div
        [ class "combat-statistics" ]
        [ contentStatic { title = "ap offense", value = "3", prefix = "-", postfix = "" }
        , contentStatic { title = "ap defense", value = "3", prefix = "-", postfix = "" }
        , contentStatic { title = "ap recovery", value = "4", prefix = "+", postfix = "" }
        , contentStatic { title = "dmg per ap", value = "1", prefix = "+", postfix = "" }
        , contentStatic { title = "def. per ap", value = "1", prefix = "-", postfix = "" }
        ]
