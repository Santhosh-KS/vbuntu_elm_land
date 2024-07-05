module Components.Navbar.Start exposing
    ( Start
    , new
    , view
    )

import Components.Navbar.Item as CNI
import Html exposing (Html)
import Html.Attributes as Attr


type Start msg
    = Start
        { items : List (CNI.Item msg)
        }


new : { items : List (CNI.Item msg) } -> Start msg
new props =
    Start { items = props.items }


view : Start msg -> Html msg
view (Start s) =
    Html.div [ Attr.class "navbar-start" ] (List.map CNI.view s.items)



-- Html.div [ Attr.class "navbar-start" ] []
