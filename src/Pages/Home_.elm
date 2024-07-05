module Pages.Home_ exposing (Model, Msg, page)

import Animal exposing (Animal)
import Components.Breadcrumb as BC
import Components.Button as CB
import Components.Card as Card
import Components.Content as Content
import Components.Dropdown
import Components.Icon as CI
import Components.Image as CImg
import Components.Message as CM
import Components.Navbar.Brand as CNB
import Components.Navbar.NavMain as CNav exposing (Navbar)
import Effect as E
import Html
import Html.Attributes as Attr
import Page exposing (Page)
import Route exposing (Route)
import Shared
import View exposing (View)


page : Shared.Model -> Route () -> Page Model Msg
page shared route =
    Page.new
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- INIT


init : () -> ( Model, E.Effect Msg )
init () =
    ( { heroModel = heroContent
      , dropdown = Components.Dropdown.init { selected = Animal.defaultChoice }
      }
    , E.none
    )



-- UPDATE


update : Msg -> Model -> ( Model, E.Effect Msg )
update msg model =
    case msg of
        SingupButtonClicked ->
            ( model
            , E.none
            )

        GitHubButtonClicked ->
            ( model
            , E.none
            )

        DropdownSent innerMsg ->
            Components.Dropdown.update
                { msg = innerMsg
                , model = model.dropdown
                , toModel = \dropdown -> { model | dropdown = dropdown }
                , toMsg = DropdownSent
                }

        ChangedSelection animal ->
            ( model, E.none )

        NoOp ->
            ( model
            , E.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


type Msg
    = SingupButtonClicked
    | GitHubButtonClicked
    | DropdownSent (Components.Dropdown.Msg Animal Msg)
    | ChangedSelection Animal
    | NoOp



-- VIEW


president : Model -> Html.Html Msg
president model =
    Html.div []
        [ Html.h1 [] [ Html.text "Select a president:" ]
        , Components.Dropdown.new
            { model = model.dropdown
            , toMsg = DropdownSent
            , choices = Animal.list
            , toLabel = Animal.toName
            }
            |> Components.Dropdown.withOnChange ChangedSelection
            |> Components.Dropdown.view
        ]


viewSignUpButton : Html.Html Msg
viewSignUpButton =
    CB.new
        { label = "Sign up"
        , onClick = SingupButtonClicked
        }
        |> CB.withStyleWarning
        |> CB.view


bc : Html.Html msg
bc =
    BC.new
        { items = [ "Home", "Santhosh", "Shreshtu", "Swetu" ] }
        -- |> BC.withAlignmentCentered
        |> BC.withSeparatorBullet
        |> BC.view


dummyMessageWindow : Html.Html msg
dummyMessageWindow =
    Html.div [ Attr.class "container" ]
        [ CM.new
            { header = "My Message"
            , body = "Lorem ipsum dolor sit amet, officia excepteur ex fugiat reprehenderit enim labore culpa sint ad nisi Lorem pariatur mollit ex esse exercitation amet. Nisi anim cupidatat excepteur officia. Reprehenderit nostrud nostrud ipsum Lorem est aliquip amet voluptate voluptate dolor minim nulla est proident. Nostrud officia pariatur ut officia. Sit irure elit esse ea nulla sunt ex occaecat reprehenderit commodo officia dolor Lorem duis laboris cupidatat officia voluptate. Culpa proident adipisicing id nulla nisi laboris ex in Lorem sunt duis officia eiusmod. Aliqua reprehenderit commodo ex non excepteur duis sunt velit enim. Voluptate laboris sint cupidatat ullamco ut ea consectetur et est culpa et culpa duis."
            }
            |> CM.withStyleDanger
            |> CM.withCloseButton
            |> CM.view
        ]


displayImage : Html.Html msg
displayImage =
    Html.div [ Attr.class "box" ]
        [ placeHolderImg
            |> CImg.with128x128
            |> CImg.view
        ]


placeHolderImg : CImg.Image msg
placeHolderImg =
    CImg.new
        { src = "https://bulma.io/assets/images/placeholders/1280x960.png"
        , altText = "Placeholder Image"
        }
        |> CImg.with64x64


placeHolderContent : Content.Content msg
placeHolderContent =
    Content.new
        { content = "Lorem ipsum dolor sit amet, officia excepteur ex fugiat reprehenderit enim labore culpa sint ad nisi Lorem pariatur mollit ex esse exercitation amet. Nisi anim cupidatat excepteur officia. Reprehenderit nostrud nostrud ipsum Lorem est aliquip amet voluptate voluptate dolor minim nulla est proident. Nostrud officia pariatur ut officia. Sit irure elit esse ea nulla sunt ex occaecat reprehenderit commodo officia dolor Lorem duis laboris cupidatat officia voluptate. Culpa proident adipisicing id nulla nisi laboris ex in Lorem sunt duis officia eiusmod. Aliqua reprehenderit commodo ex non excepteur duis sunt velit enim. Voluptate laboris sint cupidatat ullamco ut ea consectetur et est culpa et culpa duis."
        }


placeHolderCard : Html.Html msg
placeHolderCard =
    Html.div []
        [ -- Card.new
          Card.new
            { title = "My Card"
            }
            |> Card.withContent placeHolderContent
            |> Card.withImage placeHolderImg
            |> Card.withFooter [ "Save", "Edit", "Shreshtu" ]
            |> Card.view
        ]


testImg : CImg.Image msg
testImg =
    CImg.new
        { src = "./assets/vbuntuText1080X260.png"
        , altText = "Brand Image"
        }


brandImg : CNB.Brand msg
brandImg =
    CNB.new
        { image = testImg }
        |> CNB.withImageLink "https://vbuntu.org"


testNav : CNav.Navbar msg
testNav =
    CNav.new
        { brand = Just brandImg
        }


view : Model -> View Msg
view model =
    { title = "Home"
    , body =
        [ hero model.heroModel
        , Html.div [ Attr.class "container" ]
            [ bc
            , testNav |> CNav.view

            {- , placeHolderCard
               , viewSignUpButton
               , president model
               , dummyMessageWindow
               , displayImage
            -}
            ]
        ]
    }


type alias Model =
    { heroModel : HeroModel
    , dropdown : Components.Dropdown.Model Animal
    }



-- HERO


type alias HeroModel =
    { image : String
    , title : String
    , subTitle : String
    , navBarModel : NavBarModel
    }


heroContent : HeroModel
heroContent =
    { image = "./assets/trophyLogo.png"
    , title = ""
    , subTitle = "A Community for Creative Engineers.."
    , navBarModel = { image = "./assets/vbuntuText1080X260.png", width = 120, menuItems = [ "Home", "Examples", "Documentation" ] }
    }


heroHead : HeroModel -> Html.Html Msg
heroHead model =
    Html.div [ Attr.class "hero-head" ] [ navBar model.navBarModel ]


hero : HeroModel -> Html.Html Msg
hero model =
    Html.section [ Attr.class "hero is-primary " ]
        -- Html.section [ Attr.class "hero is-primary is-fullheight " ]
        [ heroHead model
        , heroBody model
        , heroFooter model
        ]


testingHeroImg : String -> Html.Html msg
testingHeroImg src =
    CImg.new
        { src = src
        , altText = "Hero image"
        }
        -- |> CImg.with3by4
        |> CImg.view


heroBody : HeroModel -> Html.Html Msg
heroBody model =
    Html.div [ Attr.class "hero-body" ]
        [ Html.div [ Attr.class "container has-text-centered" ]
            [ testingHeroImg model.image

            -- Html.img [ Attr.src model.image ] []
            , stringToPtag "title" model.title
            , stringToPtag "subtitle" model.subTitle
            ]
        ]


heroFooter : HeroModel -> Html.Html Msg
heroFooter model =
    Html.div [ Attr.class "hero-footer" ]
        [ Html.nav [ Attr.class "tabs is-boxed is-fullwidth" ]
            [ Html.div [ Attr.class "container" ]
                [ Html.ul []
                    [ Html.li [ Attr.class "is-active" ] [ stringToAtag "" "Overview" ]
                    , Html.li [] [ stringToAtag "" "Grid" ]
                    , Html.li [] [ stringToAtag "" "Elements" ]
                    , Html.li [] [ stringToAtag "" "Components" ]
                    , Html.li [] [ stringToAtag "" "Layouts" ]
                    ]
                ]
            ]
        ]



-- NAVBAR


type alias NavBarModel =
    { image : String
    , width : Int
    , menuItems : List String
    }


spanGen : Int -> Html.Html Msg
spanGen _ =
    Html.span [] []


navBarBurger : Html.Html Msg
navBarBurger =
    let
        s =
            List.map spanGen (List.repeat 4 1)
    in
    Html.span [ Attr.class "navbar-burger" ] s


navBarLogo : NavBarModel -> Html.Html Msg
navBarLogo model =
    Html.a [ Attr.class "navbar-item" ]
        [ Html.img
            [ Attr.src model.image
            , Attr.width model.width
            ]
            []
        ]


navBarBrand : NavBarModel -> Html.Html Msg
navBarBrand model =
    Html.div [ Attr.class "navbar-brand" ]
        [ navBarLogo model
        , navBarBurger
        ]


navBar : NavBarModel -> Html.Html Msg
navBar model =
    Html.header [ Attr.class "navbar" ]
        [ Html.div [ Attr.class "container" ]
            [ navBarBrand model
            , navBarMenu model
            ]
        ]


stringToAtag : String -> String -> Html.Html Msg
stringToAtag className value =
    Html.a [ Attr.class className ]
        [ Html.text value ]


stringToPtag : String -> String -> Html.Html Msg
stringToPtag className value =
    Html.p [ Attr.class className ]
        [ Html.text value ]


stringToLitag : String -> String -> Html.Html Msg
stringToLitag className value =
    Html.li [ Attr.class className ]
        [ Html.text value ]


gitHubIcon : CI.Icon Msg
gitHubIcon =
    CI.new
        { font = "fas fa-angle-down"
        , onClick = NoOp
        }
        |> CI.withStyleWarning


viewGitHubButton : Html.Html Msg
viewGitHubButton =
    Html.span [ Attr.class "navbar-item" ]
        [ CB.new
            { label = "Download"
            , onClick = GitHubButtonClicked
            }
            |> CB.withStyleDanger
            |> CB.withIconLeft gitHubIcon
            |> CB.view
        ]



{- gitHubButton : Html Msg
   gitHubButton =
       Html.span [ Attr.class "navbar-item" ]
           [ Html.a [ Attr.class "button is-danger is-inverted" ]
               [ Html.span [ Attr.class "icon fas fa-book" ] []

               {- [ Html.i [ Attr.class "fas fa-book" ] []
                  ]
               -}
               , Html.span
                   []
                   [ Html.text "Download" ]
               ]
           ]
-}


navBarMenu : NavBarModel -> Html.Html Msg
navBarMenu model =
    Html.div [ Attr.class "navbar-menu" ]
        [ Html.div [ Attr.class "navbar-end" ]
            [ stringToAtag "navbar-item is-active" "Home"
            , stringToAtag "navbar-item " "Examples"
            , stringToAtag "navbar-item " "Documents"
            , viewGitHubButton

            -- , gitHubButton
            ]
        ]
