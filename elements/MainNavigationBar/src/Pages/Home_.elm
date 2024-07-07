module Pages.Home_ exposing (page)

import Components.Image as CImg
import Components.Navbar.Brand as CNB
import Components.Navbar.Item as CNI
import Components.Navbar.Link as CNL
import Components.Navbar.Menu as CNM
import Components.Navbar.NavMain as CNN
import Html
import Html.Attributes as Attr
import NavItems exposing (..)
import View exposing (View)


bImg : CImg.Image msg
bImg =
    CImg.new { src = "./assets/vbuntuText1080X260.png", altText = "vbuntu logo" }


brand : CNB.Brand msg
brand =
    CNB.new { image = bImg }


navMenu : CNM.Menu NavItems.MenuItems msg
navMenu =
    CNM.new { items = NavItems.list, active = NavItems.toBool, toString = NavItems.toString }


navMain : CNN.Navbar NavItems.MenuItems msg
navMain =
    CNN.new { brand = Just brand } |> CNN.withMenu navMenu


page : View msg
page =
    { title = "Homepage"
    , body =
        [ Html.div [ Attr.class "container" ]
            [ Html.div [ Attr.class "navbar" ]
                [ navMain |> CNN.view
                ]
            ]
        ]
    }
