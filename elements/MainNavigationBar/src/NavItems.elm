module NavItems exposing
    ( MenuItems
    , list
    , toBool
    , toString
    )


type MenuItems
    = Dog
    | Cat
    | Dolphin
    | Pig


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


toBool : MenuItems -> Bool
toBool items =
    case items of
        Dog ->
            True

        Cat ->
            True

        Dolphin ->
            True

        Pig ->
            True
