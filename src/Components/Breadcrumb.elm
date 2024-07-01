module Components.Breadcrumb exposing
    ( Breadcrumb
    , new
    , view
    , withAlignmentCentered
    , withAlignmentRight
    , withSeparatorBullet
    , withSeparatorDot
    , withSeparatorSucceeds
    )

import Html exposing (..)
import Html.Attributes as Attr exposing (..)


type Breadcrumb msg
    = Settings
        { items : List String
        , alignment : Alignment
        , separator : Separator
        }


type Alignment
    = Default
    | Center
    | Right


type Separator
    = Arrow
    | Bullet
    | Dot
    | Succeeds


withAlignmentCentered : Breadcrumb msg -> Breadcrumb msg
withAlignmentCentered (Settings settings) =
    Settings { settings | alignment = Center }


withAlignmentRight : Breadcrumb msg -> Breadcrumb msg
withAlignmentRight (Settings settings) =
    Settings { settings | alignment = Right }


withSeparatorBullet : Breadcrumb msg -> Breadcrumb msg
withSeparatorBullet (Settings settings) =
    Settings { settings | separator = Bullet }


withSeparatorDot : Breadcrumb msg -> Breadcrumb msg
withSeparatorDot (Settings settings) =
    Settings { settings | separator = Dot }


withSeparatorSucceeds : Breadcrumb msg -> Breadcrumb msg
withSeparatorSucceeds (Settings settings) =
    Settings { settings | separator = Succeeds }


new : { items : List String } -> Breadcrumb msg
new props =
    Settings
        { items = props.items
        , alignment = Default
        , separator = Arrow
        }


stringToLiTag : String -> Html msg
stringToLiTag t =
    Html.li [ Attr.href "#" ] [ Html.text t ]


view : Breadcrumb mag -> Html msg
view (Settings settings) =
    Html.section [ Attr.class "pt-6 pb-2" ]
        [ Html.div [ Attr.class "container" ]
            [ Html.nav
                [ Attr.class "breadcrumb"
                , Attr.classList
                    [ ( "", settings.alignment == Default )
                    , ( "is-centered", settings.alignment == Center )
                    , ( "is-right", settings.alignment == Right )
                    , ( "has-arrow-separator", settings.separator == Arrow )
                    , ( "has-bullet-separator", settings.separator == Bullet )
                    , ( "has-dot-separator", settings.separator == Dot )
                    , ( "has-succeeds-separator", settings.separator == Succeeds )
                    ]
                ]
                [ Html.ul [] (List.map stringToLiTag settings.items) ]
            ]
        ]
