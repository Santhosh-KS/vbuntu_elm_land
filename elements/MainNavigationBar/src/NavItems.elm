module NavItems exposing
    ( MenuItems(..)
    , list
    , toString
    )


type MenuItems
    = Home
    | Documents
    | Github
    | SignUp


list : List MenuItems
list =
    [ Home, Documents, Github, SignUp ]


toString : MenuItems -> String
toString items =
    case items of
        Home ->
            "Home"

        Documents ->
            "Documents"

        Github ->
            "Github"

        SignUp ->
            "SignUp"
