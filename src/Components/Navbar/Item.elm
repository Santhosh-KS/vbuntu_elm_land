module Components.Navbar.Item exposing
    ( Item
    , new
    , view
    )

import Components.Navbar.Divider as CND
import Components.Navbar.Link as CNL
import Html exposing (Html)


type Item msg
    = Item
        { link : List (CNL.Link msg)
        , dropdown : List (Item msg)
        , divider : Maybe (CND.Divider msg)
        , itemsAfterDivider : List (Item msg)
        }


new : { text : String } -> Item msg
new props =
    Item
        { link = []
        , dropdown = []
        , divider = Nothing
        , itemsAfterDivider = []
        }


view : Item msg -> Html msg
view (Item i) =
    Html.div [] []
