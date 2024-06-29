module Components.Icon exposing
    ( Icon
    , new
    , view
    , withSizeLarge
    , withSizeMedium
    , withSizeNormal
    , withSizeSmall
    , withStyleDanger
    , withStyleSuccess
    , withStyleWarning
    )

import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events


type Icon msg
    = Settings
        { font : String
        , text : String
        , onClick : msg
        , style : Style
        , size : Size
        }


type Style
    = Default
    | Success
    | Warning
    | Danger


type Size
    = Small
    | Normal
    | Medium
    | Large


new : { font : String, text : String, onClick : msg } -> Icon msg
new props =
    Settings
        { font = props.font
        , text = props.text
        , onClick = props.onClick
        , style = Default
        , size = Normal
        }


withStyleSuccess : Icon msg -> Icon msg
withStyleSuccess (Settings settings) =
    Settings { settings | style = Success }


withStyleWarning : Icon msg -> Icon msg
withStyleWarning (Settings settings) =
    Settings { settings | style = Warning }


withStyleDanger : Icon msg -> Icon msg
withStyleDanger (Settings settings) =
    Settings { settings | style = Danger }


withSizeSmall : Icon msg -> Icon msg
withSizeSmall (Settings settings) =
    Settings { settings | size = Small }


withSizeNormal : Icon msg -> Icon msg
withSizeNormal (Settings settings) =
    Settings { settings | size = Normal }


withSizeMedium : Icon msg -> Icon msg
withSizeMedium (Settings settings) =
    Settings { settings | size = Medium }


withSizeLarge : Icon msg -> Icon msg
withSizeLarge (Settings settings) =
    Settings { settings | size = Large }


view : Icon msg -> Html msg
view (Settings settings) =
    Html.span
        [ Attr.class "icon"
        , Html.Events.onClick settings.onClick
        ]
        [ Html.i [ Attr.class settings.font ] []
        ]
