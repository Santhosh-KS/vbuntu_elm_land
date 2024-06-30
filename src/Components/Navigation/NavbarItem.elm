module Components.Navigation.NavbarItem exposing
    ( NavbarItem
    , new
    , view
    , withText
    )

import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events


type NavbarItem msg
    = Settings
        { imagePath : String
        , onClick : msg
        , text : Maybe String
        , href : Maybe String
        }


new : { imagePath : String, onClick : msg } -> NavbarItem msg
new props =
    Settings
        { imagePath = props.imagePath
        , onClick = props.onClick
        , text = Just ""
        , href = Just ""
        }


withText : String -> NavbarItem msg -> NavbarItem msg
withText text (Settings settings) =
    Settings { settings | text = Just text }


withHref : String -> NavbarItem msg -> NavbarItem msg
withHref href (Settings settings) =
    Settings { settings | href = Just href }



{- wrapNavbarItem : Html msg -> NavbarItem msg
   wrapNavbarItem (Html val) =
       Html.div [ Attr.class "navbar-item" ] [ val ]
-}


view : NavbarItem msg -> Html msg
view (Settings settings) =
    let
        h =
            case settings.href of
                Just hr ->
                    hr

                Nothing ->
                    ""

        t =
            case settings.text of
                Just text ->
                    text

                Nothing ->
                    ""
    in
    Html.a [ Attr.class "navbar-item" ] [ Html.text t ]
