module Components.Navigation.NavbarBrand exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events


type NavbarBrand msg
    = Settings
        { imagePath : String
        , onClick : msg
        }


new : { imagePath : String, onClick : msg } -> NavbarBrand msg
new props =
    Settings
        { imagePath = props.imagePath
        , onClick = props.onClick
        }
