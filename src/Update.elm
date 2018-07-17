module Update exposing (..)

import Models exposing (..)
import Domain exposing (buySkill)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        HideDialog dialog ->
            let
                oldDialog =
                    model.dialogs
            in
                case dialog of
                    WeaponsDialog ->
                        let
                            newDialog =
                                { oldDialog | weapons = not oldDialog.weapons }
                        in
                            ( { model | dialogs = newDialog }, Cmd.none )

                    ResistancesDialog ->
                        let
                            newDialog =
                                { oldDialog | resistances = not oldDialog.resistances }
                        in
                            ( { model | dialogs = newDialog }, Cmd.none )

                    _ ->
                        ( model, Cmd.none )

        BuySkill source name ->
            let
                newCharacter =
                    buySkill model.character source name
            in
                ( { model | character = newCharacter }, Cmd.none )

        _ ->
            ( model, Cmd.none )
