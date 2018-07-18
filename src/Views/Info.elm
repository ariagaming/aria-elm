module Views.Info exposing (..)

import Html exposing (Html, Attribute, text, div, span, img, input, label)
import Html.Attributes exposing (class, style, src)
import Html.Events exposing (onClick)
import Models exposing (..)
import Maybe exposing (withDefault)


renderCharacterInfo : Character -> Html Msg
renderCharacterInfo (Character character) =
    div [ class "character-info" ]
        [ img [ src "/assets/character-info.png" ] []
        , span
            [ class "race trigger"
            , onClick (ToggleDialog RacialPackageDialog)
            ]
            [ text "Human"
            ]
        , span
            [ class "profession trigger"
            , onClick (ToggleDialog RacialPackageDialog)
            ]
            [ text "Warrior"
            ]
        , span
            [ class "specialization" ]
            [ text "Barbarian" ]
        , span
            [ class "alignment trigger"
            , onClick (ToggleDialog RacialPackageDialog)
            ]
            [ text "Neutral"
            ]
        , span
            [ class "player-name trigger"
            , onClick (ToggleDialog RacialPackageDialog)
            ]
            [ text "Boris"
            ]
        , span
            [ class "xp trigger"
            , onClick (ToggleDialog RacialPackageDialog)
            ]
            [ (withDefault 0 character.xp)
                |> toString
                |> text
            ]
        , span
            [ class "character-name trigger"
            , onClick (ToggleDialog RacialPackageDialog)
            ]
            [ text "Peter Pan"
            ]
        ]
