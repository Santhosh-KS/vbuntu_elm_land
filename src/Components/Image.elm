module Components.Image exposing (..)

import Html exposing (..)
import Html.Attributes as Attr exposing (..)


type Image msg
    = Settings
        { src : String
        , altText : String
        , size : Size
        , position : Position
        }


type Position
    = Left
    | Right
    | Centered


new : { src : String, altText : String } -> Image msg
new props =
    Settings { src = props.src, altText = props.altText, size = Default, position = Left }


view : Image msg -> Html msg
view (Settings settings) =
    Html.img
        [ Attr.classList
            [ ( "is-128x128", settings.size == IS128x128 )
            , ( "is-16by9", settings.size == IS16by9 )
            , ( "is-16x16", settings.size == IS16x16 )
            , ( "is-1by1", settings.size == IS1by1 )
            , ( "is-1by2", settings.size == IS1by2 )
            , ( "is-1by3", settings.size == IS1by3 )
            , ( "is-24x24", settings.size == IS24x24 )
            , ( "is-2by1", settings.size == IS2by1 )
            , ( "is-2by3", settings.size == IS2by3 )
            , ( "is-32x32", settings.size == IS32x32 )
            , ( "is-3by1", settings.size == IS3by1 )
            , ( "is-3by2", settings.size == IS3by2 )
            , ( "is-3by4", settings.size == IS3by4 )
            , ( "is-3by5", settings.size == IS3by5 )
            , ( "is-48x48", settings.size == IS48x48 )
            , ( "is-4by3", settings.size == IS4by3 )
            , ( "is-4by5", settings.size == IS4by5 )
            , ( "is-5by3", settings.size == IS5by3 )
            , ( "is-5by4", settings.size == IS5by4 )
            , ( "is-64x64", settings.size == IS64x64 )
            , ( "is-96x96", settings.size == IS96x96 )
            , ( "is-9by6", settings.size == IS9by16 )
            , ( "is-square", settings.size == ISSquare )
            , ( "has-text-centered", settings.position == Centered )
            , ( "has-text-left", settings.position == Left )
            , ( "has-text-right", settings.position == Right )
            ]
        , Attr.src settings.src
        , Attr.alt settings.altText
        ]
        []


type Size
    = Default
    | IS128x128
    | IS16by9
    | IS16x16
    | IS1by1
    | IS1by2
    | IS1by3
    | IS24x24
    | IS2by1
    | IS2by3
    | IS32x32
    | IS3by1
    | IS3by2
    | IS3by4
    | IS3by5
    | IS48x48
    | IS4by3
    | IS4by5
    | IS5by3
    | IS5by4
    | IS64x64
    | IS96x96
    | IS9by16
    | ISSquare


with128x128 : Image msg -> Image msg
with128x128 (Settings settings) =
    Settings { settings | size = IS128x128 }


with16by9 : Image msg -> Image msg
with16by9 (Settings settings) =
    Settings { settings | size = IS16by9 }


with16x16 : Image msg -> Image msg
with16x16 (Settings settings) =
    Settings { settings | size = IS16x16 }


with1by1 : Image msg -> Image msg
with1by1 (Settings settings) =
    Settings { settings | size = IS1by1 }


with1by2 : Image msg -> Image msg
with1by2 (Settings settings) =
    Settings { settings | size = IS1by2 }


with1by3 : Image msg -> Image msg
with1by3 (Settings settings) =
    Settings { settings | size = IS1by3 }


with24x24 : Image msg -> Image msg
with24x24 (Settings settings) =
    Settings { settings | size = IS24x24 }


with2by1 : Image msg -> Image msg
with2by1 (Settings settings) =
    Settings { settings | size = IS2by1 }


with2by3 : Image msg -> Image msg
with2by3 (Settings settings) =
    Settings { settings | size = IS2by3 }


with32x32 : Image msg -> Image msg
with32x32 (Settings settings) =
    Settings { settings | size = IS32x32 }


with3by1 : Image msg -> Image msg
with3by1 (Settings settings) =
    Settings { settings | size = IS3by1 }


with3by2 : Image msg -> Image msg
with3by2 (Settings settings) =
    Settings { settings | size = IS3by2 }


with3by4 : Image msg -> Image msg
with3by4 (Settings settings) =
    Settings { settings | size = IS3by4 }


with3by5 : Image msg -> Image msg
with3by5 (Settings settings) =
    Settings { settings | size = IS3by5 }


with48x48 : Image msg -> Image msg
with48x48 (Settings settings) =
    Settings { settings | size = IS48x48 }


with4by3 : Image msg -> Image msg
with4by3 (Settings settings) =
    Settings { settings | size = IS4by3 }


with4by5 : Image msg -> Image msg
with4by5 (Settings settings) =
    Settings { settings | size = IS4by5 }


with5by3 : Image msg -> Image msg
with5by3 (Settings settings) =
    Settings { settings | size = IS5by3 }


with5by4 : Image msg -> Image msg
with5by4 (Settings settings) =
    Settings { settings | size = IS5by4 }


with64x64 : Image msg -> Image msg
with64x64 (Settings settings) =
    Settings { settings | size = IS64x64 }


with96x96 : Image msg -> Image msg
with96x96 (Settings settings) =
    Settings { settings | size = IS96x96 }


with9by16 : Image msg -> Image msg
with9by16 (Settings settings) =
    Settings { settings | size = IS9by16 }


withsquare : Image msg -> Image msg
withsquare (Settings settings) =
    Settings { settings | size = ISSquare }
