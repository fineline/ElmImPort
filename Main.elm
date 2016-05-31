import Html.App as App
import Html exposing (..)
import Html.Events exposing (..)

import Model exposing (..)
import Ports exposing (..)


main = App.program {
    init = (model, Cmd.none),
    update = update,
    view = view,
    subscriptions = subscriptions
  }


type Msg = Noop
  | GetSize
  | GotSize Size


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Noop ->
      (model, Cmd.none)

    GetSize ->
      (model, getSize 2)

    GotSize size ->
      ({ model | size = Just size }, Cmd.none)


view : Model -> Html Msg
view model =
  div [] [
    div [] [ text "Click below to discover the size of this document, with a short delay" ],
    button [ onClick GetSize ] [ text "Get Size" ],
    sizeView model.size
  ]


sizeView : Maybe Size -> Html Msg
sizeView maybeSize =
  case maybeSize of
    Nothing ->
      div [] [ text "No click yet..." ]

    Just size ->
      div [] [
        div [] [ "Width: " ++ (toString size.width) |> text ],
        div [] [ "Height: " ++ (toString size.height) |> text ]
      ]


subscriptions : Model -> Sub Msg
subscriptions model =
  gotSize GotSize