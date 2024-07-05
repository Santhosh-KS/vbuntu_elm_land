module Components.Navbar.NavMain exposing
    ( Navbar
    , new
    , view
    , withBrand
    , withEnd
    , withMenu
    )

import Components.Navbar.Brand as CNB exposing (Brand)
import Components.Navbar.Burger as CNBurg exposing (BurgerMenu)
import Components.Navbar.End as CNEnd exposing (End)
import Components.Navbar.Menu as CNM exposing (Menu)
import Html exposing (Html)
import Html.Attributes as Attr


type Navbar msg
    = Navbar
        { brand : Maybe (Brand msg)
        , menu : Maybe (Menu msg)
        , burgerMenu : BurgerMenu msg
        , end : Maybe (End msg)
        }


withBrand : Brand msg -> Navbar msg -> Navbar msg
withBrand brand (Navbar n) =
    Navbar { n | brand = Just brand }


withMenu : Menu msg -> Navbar msg -> Navbar msg
withMenu menu (Navbar n) =
    Navbar { n | menu = Just menu }


withEnd : End msg -> Navbar msg -> Navbar msg
withEnd end (Navbar n) =
    Navbar { n | end = Just end }


bM : BurgerMenu msg
bM =
    CNBurg.new
        { text = "Dummy text"
        }


new : { brand : Maybe (Brand msg) } -> Navbar msg
new props =
    Navbar
        { brand = props.brand
        , menu = Nothing
        , burgerMenu = bM
        , end = Nothing
        }


view : Navbar msg -> Html msg
view (Navbar nb) =
    let
        burgerMenu =
            nb.burgerMenu |> CNBurg.view

        brand =
            case nb.brand of
                Just b ->
                    b |> CNB.view

                Nothing ->
                    Html.text ""

        menu =
            case nb.menu of
                Just m ->
                    m |> CNM.view

                Nothing ->
                    Html.text ""

        end =
            case nb.end of
                Just e ->
                    e |> CNEnd.view

                Nothing ->
                    Html.text ""
    in
    Html.nav
        [ Attr.class "navbar"
        ]
        [ brand
        , burgerMenu
        , menu
        , end
        ]
