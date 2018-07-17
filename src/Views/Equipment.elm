module Views.Equipment exposing (..)

import Html exposing (Html, Attribute, text, div, span, img, input, label)
import Html.Attributes exposing (class, style, src)
import List exposing (map)
import Models exposing (..)


renderEquipment : Armors -> Html Msg
renderEquipment (Armors armors) =
    div
        [ class "content-equipment" ]
        (map
            (\(Armor armor) ->
                div [ class "equipment-row" ]
                    [ span [ class "location" ] [ text <| toString armor.location ]
                    ]
            )
            armors
        )



--[ div [ class "equipment-item" ] [ div [] [ text "asdasd" ] ] ]
