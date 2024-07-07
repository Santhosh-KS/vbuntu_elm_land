module Components.Navbar.DropDown exposing
    ( DropDown
    , new
    , view
    )

import Components.Navbar.Link as CNL
import Html exposing (Html)
import Html.Attributes as Attr


type DropDown msg
    = DropDown
        { head : CNL.Link msg
        , rest : List (CNL.Link msg)
        }


new : { head : CNL.Link msg, rest : List (CNL.Link msg) } -> DropDown msg
new props =
    DropDown
        { head = props.head
        , rest = props.rest
        }


view : DropDown msg -> Html msg
view (DropDown d) =
    let
        h =
            d.head |> CNL.view

        l =
            List.map CNL.view d.rest
    in
    Html.div
        [-- Attr.class "navbar-dropdown"
        ]
        [ Html.a [ Attr.class "navbar-link" ]
            [ h
            , Html.div [] l
            ]
        ]
