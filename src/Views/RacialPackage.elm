module Views.RacialPackage exposing (..)

import Html exposing (Html, div, span, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Models exposing (..)
import Components.Dialog exposing (dialog)


raceDialog : Bool -> Html Msg
raceDialog show =
    dialog show "Racial Package" RacialPackageDialog Nothing
