module Components.Navbar.End exposing
    ( End
    , new
    , view
    )

import Components.Navbar.Item as CNI
import Html exposing (Html)
import Html.Attributes as Attr


type End msg
    = End
        { items : List (CNI.Item msg)
        }


new : { items : List (CNI.Item msg) } -> End msg
new props =
    End { items = props.items }


view : End msg -> Html msg
view (End s) =
    Html.div [ Attr.class "navbar-start" ] (List.map CNI.view s.items)
