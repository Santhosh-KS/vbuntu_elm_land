module Components.Navbar.NavMain exposing
    ( Navbar
    , new
    , view
    , withBrand
    , withMenu
    )

import Components.Navbar.Brand as CNB exposing (Brand)
import Components.Navbar.Burger as CNBurg exposing (BurgerMenu)
import Components.Navbar.Menu as CNM exposing (Menu)
import Html exposing (Html)
import Html.Attributes as Attr


type Navbar item msg
    = Navbar
        { brand : Maybe (Brand msg)
        , menu : Maybe (Menu item msg)
        , burgerMenu : BurgerMenu msg
        }


withBrand : Brand msg -> Navbar item msg -> Navbar item msg
withBrand brand (Navbar n) =
    Navbar { n | brand = Just brand }


withMenu : Menu item msg -> Navbar item msg -> Navbar item msg
withMenu menu (Navbar n) =
    Navbar { n | menu = Just menu }


bM : BurgerMenu msg
bM =
    CNBurg.new
        { text = "Dummy text"
        }


new : { brand : Maybe (Brand msg) } -> Navbar item msg
new props =
    Navbar
        { brand = props.brand
        , menu = Nothing
        , burgerMenu = bM
        }


view : Navbar item msg -> Html msg
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
    in
    Html.div [ Attr.class "navbar-menu" ]
        [ brand
        , burgerMenu
        , menu
        ]



-- menu
