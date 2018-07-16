module Views.General exposing (..)

import Html exposing (Html, Attribute, text, div, img, input, label, i)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Svg exposing (svg, circle)
import Svg.Attributes exposing (height, width, cx, cy, r, fill, stroke)
import Models exposing (..)


content : String -> List (Html Msg) -> Html Msg
content title children =
    let
        c =
            children
                ++ [ div [ class "title" ] [ text title ]
                   , div [ class "nav-button", onClick (Edit title) ]
                        [ i [ class "fas fa-pencil-alt" ] []
                        ]
                   ]
    in
        div [ class "content" ] c


checkedCircle : Bool -> Html Msg
checkedCircle checked =
    let
        color =
            if checked then
                "black"
            else
                "white"
    in
        svg [ height "10", width "12" ]
            [ circle [ cx "6", cy "5", r "4", stroke "black" ] []
            ]


boughtIndicator : Source -> Html Msg
boughtIndicator boughtFrom =
    let
        getColor source =
            case source of
                None ->
                    "white"

                RacialPackage ->
                    "rgba(1, 188, 213, 1.000)"

                ProfessionalPackage ->
                    "rgba(254, 64, 129, 1.000)"

                XP ->
                    "black"

                _ ->
                    "teal"
    in
        svg [ height "10", width "12" ]
            [ circle [ cx "6", cy "5", r "4", fill <| (getColor boughtFrom), stroke "black" ] []
            ]


contentStatic : { title : String, value : String, prefix : String, postfix : String } -> Html Msg
contentStatic { title, value, prefix, postfix } =
    div
        [ class "content content-statistic" ]
        [ div [ class "title" ] [ text title ]
        , div [ class "value" ]
            [ div [ class "prefix" ] [ text prefix ]
            , div [ class "value-number" ] [ text value ]
            , div [ class "postfix" ] [ text postfix ]
            ]
        ]



-- export const ContentStatistic = ({
--   title = "movement",
--   value = 100,
--   prefix = "+",
--   postfix = "%"
-- }) => (
--   <Content className="content-statistic" title={title}>
--     <div className="value">
--       <div className="prefix">{prefix}</div>
--       <div className="value-number">{value}</div>
--       <div className="postfix">{postfix}</div>
--     </div>
--   </Content>
-- );
