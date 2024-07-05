module Components.Navbar.Divider exposing
    ( Divider
    , new
    , view
    )

import Html exposing (Html)
import Html.Attributes as Attr


type Divider msg
    = Divider
        { text : String
        }


new : { text : String } -> Divider msg
new props =
    Divider { text = props.text }


view : Divider msg -> Html msg
view (Divider d) =
    Html.a [ Attr.class "navbar-link" ] [ Html.text d.text ]
