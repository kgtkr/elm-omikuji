module Omikuji exposing (..)

import Random exposing (Generator)


type Omikuji
    = Daikiti
    | Tyukiti
    | Syokiti
    | Kiti
    | Hankiti
    | Suekiti
    | Matusyokiti
    | Kyo
    | Syokyo
    | Hankyo
    | Suekyo
    | Daikyo


name : Omikuji -> String
name omikuji =
    case omikuji of
        Daikiti ->
            "大吉"

        Tyukiti ->
            "中吉"

        Syokiti ->
            "小吉"

        Kiti ->
            "吉"

        Hankiti ->
            "半吉"

        Suekiti ->
            "末吉"

        Matusyokiti ->
            "末小吉"

        Kyo ->
            "凶"

        Syokyo ->
            "小凶"

        Hankyo ->
            "半凶"

        Suekyo ->
            "末凶"

        Daikyo ->
            "大凶"


fromInt : Int -> Omikuji
fromInt n =
    case n of
        0 ->
            Daikiti

        1 ->
            Tyukiti

        2 ->
            Syokiti

        3 ->
            Kiti

        4 ->
            Hankiti

        5 ->
            Suekiti

        6 ->
            Matusyokiti

        7 ->
            Kyo

        8 ->
            Syokyo

        9 ->
            Hankyo

        10 ->
            Suekyo

        _ ->
            Daikyo


random : Cmd Omikuji
random =
    Random.generate fromInt (Random.int 0 11)
