module Views.Statistics exposing (..)

import Html exposing (Html, Attribute, text, div, span, img, input, label)
import Html.Attributes exposing (class, style, src)
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
