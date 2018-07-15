module Views.General exposing (..)

import Html exposing (Html, Attribute, text, div, img, input, label)
import Html.Attributes exposing (class)
import Svg exposing (svg, circle)
import Svg.Attributes exposing (height, width, cx, cy, r, fill, stroke)
import Models exposing (..)


content : String -> String -> List (Html Msg) -> Html Msg
content title className children =
    let
        c =
            children
                ++ [ div [ class "title" ] [ text title ]
                   ]
    in
        div [ class ("content " ++ className) ] c


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
                    "orange"

                ProfessionalPackage ->
                    "maroon"

                XP ->
                    "black"

                _ ->
                    "teal"
    in
        svg [ height "10", width "12" ]
            [ circle [ cx "6", cy "5", r "4", fill <| (getColor boughtFrom), stroke "black" ] []
            ]



-- const Circle = ({ checked }) => (
--   <svg height="10" width="12">
--     <circle
--       cx="6"
--       cy="5"
--       r="4"
--       fill={checked ? "black" : "white"}
--       stroke="black"
--     />
--   </svg>
-- );
