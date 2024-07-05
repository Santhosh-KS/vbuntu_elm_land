module Components.Navbar.Menu exposing
    ( Menu
    , new
    , view
    )

import Components.Navbar.Divider as CND
import Components.Navbar.Item as CNI
import Components.Navbar.Start as CNStart
import Html exposing (Html)
import Html.Attributes as Attr


type Menu msg
    = Menu
        { items : List (CNI.Item msg)
        , divider : Maybe (CND.Divider msg)
        , start : Maybe (CNStart.Start msg)
        }


new : { items : List (CNI.Item msg) } -> Menu msg
new props =
    Menu
        { items = props.items
        , divider = Nothing
        , start = Nothing
        }


view : Menu msg -> Html msg
view (Menu s) =
    Html.div [ Attr.class "navbar-start" ] (List.map CNI.view s.items)



-- Html.div [ Attr.class "navbar-start" ] []
