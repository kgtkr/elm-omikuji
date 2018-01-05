module App exposing (..)

import Omikuji exposing (Omikuji)
import Html exposing (Html)
import Html.Events exposing (onClick)


type alias Model =
    Maybe Omikuji


init : ( Model, Cmd Msg )
init =
    ( Nothing, Cmd.none )


type Msg
    = UpdateOmikuji (Maybe Omikuji)
    | ClickOmikuji
    | NoOp


view : Model -> Html Msg
view model =
    Html.div [ onClick ClickOmikuji ]
        [ Html.text
            (case model of
                Just data ->
                    Omikuji.name data

                Nothing ->
                    "引く"
            )
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateOmikuji omikuji ->
            ( omikuji, Cmd.none )

        ClickOmikuji ->
            case model of
                Just _ ->
                    ( Nothing, Cmd.none )

                Nothing ->
                    ( model, Omikuji.random |> Cmd.map (Just >> UpdateOmikuji) )

        NoOp ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
