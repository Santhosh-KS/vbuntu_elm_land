module Components.Card exposing (Card)

import Components.Icon as CI
import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Components.Image as CImg

type Card msg
    = Settings
        { headerTitle : String
        , headerIcon : CI.Icon msg
        , image : Maybe (CImg.Image msg)
        , content : String
        , footer : List String
        , footerItem : List String
        }

