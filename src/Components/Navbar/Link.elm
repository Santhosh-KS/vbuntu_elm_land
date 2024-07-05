module Components.Navbar.Link exposing
    ( Link
    , new
    , view
    )

import Html exposing (Html)
import Html.Attributes as Attr


type Link msg
    = Link
        { text : String
        }


new : { text : String } -> Link msg
new props =
    Link { text = props.text }


view : Link msg -> Html msg
view (Link l) =
    Html.a [ Attr.class "navbar-link" ] [ Html.text l.text ]
