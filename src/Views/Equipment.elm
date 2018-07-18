module Views.Equipment exposing (..)

import Html exposing (Html, Attribute, text, div, span, img, input, label, i)
import Html.Attributes exposing (class, style, src)
import Html.Events exposing (onClick)
import List exposing (map, concat, append, singleton)
import Models exposing (..)


{-

   append to the head of a list
   (::)  : a -> List a -> List a

-}


(:>) : List a -> a -> List a
(:>) l a =
    append l (singleton a)


renderEquipment : Armors -> Html Msg
renderEquipment (Armors armors) =
    let
        children =
            (map
                (\(Armor armor) ->
                    div [ class "equipment-row" ]
                        [ span [ class "location" ] [ text <| toString armor.location ]
                        ]
                )
                armors
            )
                :> div [ class "nav-button", onClick (HideDialog EquipmentDialog) ]
                    [ i [ class "fas fa-pencil-alt" ] [] ]
    in
        div
            [ class "content-equipment" ]
            children



--[ div [ class "equipment-item" ] [ div [] [ text "asdasd" ] ] ]
