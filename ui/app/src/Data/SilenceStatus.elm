{-
   Alertmanager API
   API of the Prometheus Alertmanager (https://github.com/prometheus/alertmanager)

   OpenAPI spec version: 0.0.1

   NOTE: This file is auto generated by the openapi-generator.
   https://github.com/openapitools/openapi-generator.git
   Do not edit this file manually.
-}


module Data.SilenceStatus exposing (SilenceStatus, State(..), decoder, encoder)

import Dict exposing (Dict)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (optional, required)
import Json.Encode as Encode


type alias SilenceStatus =
    { state : State
    }


type State
    = Expired
    | Active
    | Pending


decoder : Decoder SilenceStatus
decoder =
    Decode.succeed SilenceStatus
        |> required "state" stateDecoder


encoder : SilenceStatus -> Encode.Value
encoder model =
    Encode.object
        [ ( "state", stateEncoder model.state )
        ]


stateDecoder : Decoder State
stateDecoder =
    Decode.string
        |> Decode.andThen
            (\str ->
                case str of
                    "expired" ->
                        Decode.succeed Expired

                    "active" ->
                        Decode.succeed Active

                    "pending" ->
                        Decode.succeed Pending

                    other ->
                        Decode.fail <| "Unknown type: " ++ other
            )


stateEncoder : State -> Encode.Value
stateEncoder model =
    case model of
        Expired ->
            Encode.string "expired"

        Active ->
            Encode.string "active"

        Pending ->
            Encode.string "pending"
