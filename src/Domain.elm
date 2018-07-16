module Domain exposing (..)

import List exposing (map)
import Models exposing (..)


buySkill : Character -> Source -> Name -> Character
buySkill (Character c) source name =
    let
        (Skills skills) =
            c.skills

        newSkills =
            map
                (\(Skill s) ->
                    if s.name == name then
                        Skill { s | boughtFrom = source }
                    else
                        Skill s
                )
                skills
    in
        Character { c | skills = Skills newSkills }
