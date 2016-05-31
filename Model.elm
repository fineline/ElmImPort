module Model exposing (..)


type alias Model = {
    size: Maybe Size
  }


type alias Size = {
    width : Int,
    height : Int
  }


model = {
    size = Nothing
  }