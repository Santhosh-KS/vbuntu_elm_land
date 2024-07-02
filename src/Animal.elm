module Animal exposing (Animal, defaultChoice, list, toName)


type Animal
    = Dog
    | Cat
    | Dolphin
    | Pig


list : List Animal
list =
    [ Dog, Cat, Dolphin, Pig ]


defaultChoice : Animal
defaultChoice =
    Dog


toName : Animal -> String
toName animal =
    case animal of
        Dog ->
            "🐶 Mr. Doge"

        Cat ->
            "🐱 Ms. Kitten"

        Dolphin ->
            "🐬 Dr. Dolphin"

        Pig ->
            "🐷 Lt. Piggins"
