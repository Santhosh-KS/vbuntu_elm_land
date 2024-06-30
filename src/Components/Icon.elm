module Components.Icon exposing
    ( Icon
    , new
    , view
    , withSizeLarge
    , withSizeMedium
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
        , onClick : msg
        , style : Style
        , size : Size
        }


type Style
    = Info
    | Success
    | Warning
    | Danger


type Size
    = Small
    | Normal
    | Medium
    | Large


new : { font : String, onClick : msg } -> Icon msg
new props =
    Settings
        { font = props.font
        , onClick = props.onClick
        , style = Info
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


withSizeMedium : Icon msg -> Icon msg
withSizeMedium (Settings settings) =
    Settings { settings | size = Medium }


withSizeLarge : Icon msg -> Icon msg
withSizeLarge (Settings settings) =
    Settings { settings | size = Large }


view : Icon msg -> Html msg
view (Settings settings) =
    Html.span
        [ Html.Events.onClick settings.onClick
        , Attr.class "icon"
        , Attr.classList
            [ ( "has-text-success", settings.style == Success )
            , ( "has-text-warning", settings.style == Warning )
            , ( "has-text-danger", settings.style == Danger )
            , ( "has-text-small", settings.size == Small )
            ]
        ]
        [ Html.i [ Attr.class settings.font ] []
        ]
