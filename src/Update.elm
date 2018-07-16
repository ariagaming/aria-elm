module Update exposing (..)

import Models exposing (..)
import Domain exposing (buySkill)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeMessage s ->
            case s of
                "" ->
                    ( { model | message = Nothing }, Cmd.none )

                _ ->
                    ( { model | message = Just s }, Cmd.none )

        BuySkill source name ->
            let
                newCharacter =
                    buySkill model.character source name
            in
                ( { model | character = newCharacter }, Cmd.none )

        _ ->
            ( model, Cmd.none )
