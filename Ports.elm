port module Ports exposing (..)

import Model exposing (..)

port getSize : Int -> Cmd msg

port gotSize : (Size -> msg) -> Sub msg