module Components.Navbar.Item exposing
    ( Item
    , new
    , view
    , withDropDown
    )

import Components.Navbar.Divider as CND
import Components.Navbar.DropDown as CNDD
import Components.Navbar.Link as CNL
import Html exposing (Html)
import Html.Attributes as Attr


type Item msg
    = Item
        { links : List (CNL.Link msg)
        , dropDown : Maybe (CNDD.DropDown msg)
        }


new : { links : List (CNL.Link msg) } -> Item msg
new props =
    Item
        { links = props.links
        , dropDown = Nothing
        }


withDropDown : CNDD.DropDown msg -> Item msg -> Item msg
withDropDown dd (Item i) =
    Item { i | dropDown = Just dd }


view : Item msg -> Html msg
view (Item i) =
    let
        l =
            List.map CNL.view i.links
    in
    Html.div [ Attr.class "navbar-item" ]
        [ Html.div [] l
        ]
