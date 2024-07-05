module Components.Navbar.Burger exposing
    ( BurgerMenu
    , new
    , view
    )

import Html exposing (Html)


type BurgerMenu msg
    = BurgerMenu { text : String }


new : { text : String } -> BurgerMenu msg
new props =
    BurgerMenu { text = props.text }


spn_ : Int -> Html msg
spn_ _ =
    Html.span [] []


view : BurgerMenu msg -> Html msg
view (BurgerMenu _) =
    let
        vals =
            List.map spn_ (List.repeat 1 4)
    in
    Html.a [] vals
