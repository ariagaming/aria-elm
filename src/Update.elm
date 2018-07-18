module Update exposing (..)

import Models exposing (..)
import Domain exposing (buySkill)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ToggleDialog dialog ->
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

                    ProfessionsDialog ->
                        let
                            newDialog =
                                { oldDialog | professions = not oldDialog.professions }
                        in
                            ( { model | dialogs = newDialog }, Cmd.none )

                    SkillsDialog ->
                        let
                            newDialog =
                                { oldDialog | skills = not oldDialog.skills }
                        in
                            ( { model | dialogs = newDialog }, Cmd.none )

                    FeaturesDialog ->
                        let
                            newDialog =
                                { oldDialog | features = not oldDialog.features }
                        in
                            ( { model | dialogs = newDialog }, Cmd.none )

                    LanguagesDialog ->
                        let
                            newDialog =
                                { oldDialog | languages = not oldDialog.languages }
                        in
                            ( { model | dialogs = newDialog }, Cmd.none )

                    SpecialsDialog ->
                        let
                            newDialog =
                                { oldDialog | specials = not oldDialog.specials }
                        in
                            ( { model | dialogs = newDialog }, Cmd.none )

                    EquipmentDialog ->
                        let
                            newDialog =
                                { oldDialog | equipment = not oldDialog.equipment }
                        in
                            ( { model | dialogs = newDialog }, Cmd.none )

                    RacialPackageDialog ->
                        let
                            newDialog =
                                { oldDialog | raceDialog = not oldDialog.raceDialog }
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
