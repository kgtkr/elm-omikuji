module App exposing (..)

import Html.Attributes exposing (..)
import Omikuji exposing (Omikuji)
import Html exposing (..)
import Html.Events exposing (..)


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
    div
        [ style
            [ ( "height", "100%" )
            , ( "display", "flex" )
            , ( "justify-content", "center" )
            , ( "align-items", "center" )
            ]
        ]
        [ button
            [ onClick ClickOmikuji
            , style
                [ ( "width", "128px" )
                , ( "height", "128px" )
                , ( "font-size", "36px" )
                , ( "color"
                  , (case model of
                        Just _ ->
                            "red"

                        Nothing ->
                            "#fff"
                    )
                  )
                , ( "background"
                  , (case model of
                        Just _ ->
                            "#fff"

                        Nothing ->
                            "red"
                    )
                  )
                , ( "border-radius", "64px" )
                , ( "border", "1px solid #000" )
                ]
            ]
            [ text
                (case model of
                    Just data ->
                        Omikuji.name data

                    Nothing ->
                        "引く"
                )
            ]
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
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
