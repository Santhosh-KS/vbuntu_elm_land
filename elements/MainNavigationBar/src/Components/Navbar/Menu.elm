module Components.Navbar.Menu exposing
    ( Menu
    , new
    , view
    )

import Html exposing (Html)
import Html.Attributes as Attr


type Menu item msg
    = Menu
        { items : List item
        , isActiveItem : item -> Bool
        , toString : item -> String
        }


new : { items : List item, active : item -> Bool, toString : item -> String } -> Menu item msg
new props =
    Menu
        { items = props.items
        , isActiveItem = props.active
        , toString = props.toString
        }


sTo : String -> Html msg
sTo s =
    Html.a
        [ Attr.class "navbar-item " ]
        [ Html.text s ]


view : Menu item msg -> Html msg
view (Menu s) =
    let
        v =
            List.map s.toString s.items
    in
    Html.div
        [ Attr.class "navbar-menu"
        ]
        [ Html.div [ Attr.class "navbar-end " ] (List.map sTo v) ]
