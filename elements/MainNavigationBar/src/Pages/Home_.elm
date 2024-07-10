module Pages.Home_ exposing (page)

{- import Components.Navbar.Item as CNI
   import Components.Navbar.Link as CNL
-}

import Components.Image as CImg
import Components.Navbar.Brand as CNB
import Components.Navbar.Menu as CNM exposing (Menu)
import Components.Navbar.NavMain as CNN
import Effect exposing (Effect)
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


menuModel : CNM.Model NavItems.MenuItems
menuModel =
    CNM.init
        { currentItem = NavItems.Dog
        }


navMenu : CNM.Menu NavItems.MenuItems msg
navMenu =
    CNM.new
        { items = NavItems.list
        , model = menuModel
        , toString = NavItems.toString
        }


navMain : CNN.Navbar NavItems.MenuItems msg
navMain =
    CNN.new { brand = Just brand } |> CNN.withMenu navMenu


page : View msg
page =
    { title = "Homepage"

    -- , init = init
    , body =
        [ Html.div [ Attr.class "container" ]
            [ Html.div [ Attr.class "navbar" ]
                [ navMain |> CNN.view
                ]
            ]
        ]
    }
