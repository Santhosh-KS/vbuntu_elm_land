module NavItems exposing
    ( MenuEvents(..)
    , MenuItems(..)
    , itemToItemEventPair
    , list
    , toString
    )

import Components.Navbar.Menu exposing (Menu)


type MenuItems
    = Dog
    | Cat
    | Dolphin
    | Pig


type MenuEvents
    = DogMenuSelected
    | PigMenuSelected
    | CatMenuSelected
    | DolphinMenuSelected


itemToItemEventPair : MenuItems -> ( MenuItems, MenuEvents )
itemToItemEventPair mi =
    case mi of
        Dog ->
            ( Dog, DogMenuSelected )

        Cat ->
            ( Cat, CatMenuSelected )

        Dolphin ->
            ( Dolphin, DolphinMenuSelected )

        Pig ->
            ( Pig, PigMenuSelected )


list : List MenuItems
list =
    [ Dog, Cat, Dolphin, Pig ]


toString : MenuItems -> String
toString items =
    case items of
        Dog ->
            "Doge"

        Cat ->
            "Kitten"

        Dolphin ->
            "Dolphin"

        Pig ->
            "Piggins"



{- currentItem : MenuItems
   currentItem =
       Pig
-}
{- toBool : MenuItems -> Bool
   toBool items =
       items == currentItem
-}
