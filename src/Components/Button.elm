module Components.Button exposing
    ( Button, new
    , view
    , withStyleSuccess, withStyleWarning, withStyleDanger
    , withSizeSmall
    , withIconLeft, withIconRight
    , withDisabled
    )

{-|


## Basic usage

@docs Button, new
@docs view


## Modifiers

@docs withStyleSuccess, withStyleWarning, withStyleDanger
@docs withSizeSmall
@docs withIconLeft, withIconRight
@docs withDisabled

-}

import Components.Icon as CI
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events



-- SETTINGS


type Button msg
    = Settings
        { label : String
        , onClick : msg
        , style : Style
        , size : Size
        , iconLeft : Maybe (CI.Icon msg)
        , iconRight : Maybe (CI.Icon msg)
        , isDisabled : Bool
        }


new : { label : String, onClick : msg } -> Button msg
new props =
    Settings
        { label = props.label
        , onClick = props.onClick
        , style = Default
        , size = Normal
        , iconLeft = Nothing
        , iconRight = Nothing
        , isDisabled = False
        }



-- MODIFIERS


type Style
    = Default
    | Success
    | Warning
    | Danger


withStyleSuccess : Button msg -> Button msg
withStyleSuccess (Settings settings) =
    Settings { settings | style = Success }


withStyleWarning : Button msg -> Button msg
withStyleWarning (Settings settings) =
    Settings { settings | style = Warning }


withStyleDanger : Button msg -> Button msg
withStyleDanger (Settings settings) =
    Settings { settings | style = Danger }


type Size
    = Normal
    | Small


withSizeSmall : Button msg -> Button msg
withSizeSmall (Settings settings) =
    Settings { settings | size = Small }


withIconLeft : CI.Icon msg -> Button msg -> Button msg
withIconLeft icon (Settings settings) =
    Settings { settings | iconLeft = Just icon }


withIconRight : CI.Icon msg -> Button msg -> Button msg
withIconRight icon (Settings settings) =
    Settings { settings | iconRight = Just icon }


withDisabled : Bool -> Button msg -> Button msg
withDisabled isDisabled (Settings settings) =
    Settings { settings | isDisabled = isDisabled }



-- VIEW


view : Button msg -> Html msg
view (Settings settings) =
    let
        viewOptionalIcon : Maybe (CI.Icon msg) -> Html msg
        viewOptionalIcon maybeIcon =
            case maybeIcon of
                Just icon ->
                    CI.view icon

                Nothing ->
                    text ""
    in
    button
        [ Html.Events.onClick settings.onClick
        , class "button"
        , classList
            [ ( "is-success", settings.style == Success )
            , ( "is-warning", settings.style == Warning )
            , ( "is-danger", settings.style == Danger )
            , ( "is-small", settings.size == Small )
            ]
        , disabled settings.isDisabled
        ]
        [ viewOptionalIcon settings.iconLeft
        , text settings.label
        , viewOptionalIcon settings.iconRight
        ]
