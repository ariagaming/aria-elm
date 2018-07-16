module Views.Info exposing (..)

import Html exposing (Html, Attribute, text, div, span, img, input, label)
import Html.Attributes exposing (class, style, src)
import Models exposing (..)


renderCharacterInfo : Character -> Html Msg
renderCharacterInfo (Character character) =
    div [ class "character-info" ]
        [ img [ src "/assets/character-info.png" ] [] ]
