module Pages.Home_ exposing (Model, Msg, page)

import Components.Button as CB
import Effect exposing (Effect)
import Html exposing (..)
import Html.Attributes as Attr exposing (..)
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


init : () -> ( Model, Effect Msg )
init () =
    ( { heroModel = heroContent }
    , Effect.none
    )



-- UPDATE


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        SingupButtonClicked ->
            ( model
            , Effect.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


type Msg
    = SingupButtonClicked



-- VIEW


viewSignUpButton : Html Msg
viewSignUpButton =
    CB.new
        { label = "Sign up"
        , onClick = SingupButtonClicked
        }
        |> CB.view


view : Model -> View Msg
view model =
    { title = "Home"
    , body =
        [ -- Html.text "/about"
          hero model.heroModel
        , viewSignUpButton
        ]
    }


type alias Model =
    { heroModel : HeroModel }



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


heroHead : HeroModel -> Html Msg
heroHead model =
    Html.div [ Attr.class "hero-head" ] [ navBar model.navBarModel ]


hero : HeroModel -> Html Msg
hero model =
    Html.section [ Attr.class "hero is-success is-fullheight " ]
        [ heroHead model
        , heroBody model
        , heroFooter model
        ]


heroBody : HeroModel -> Html Msg
heroBody model =
    Html.div [ Attr.class "hero-body" ]
        [ Html.div [ Attr.class "container has-text-centered" ]
            [ Html.img [ Attr.src model.image ] []
            , stringToPtag "title" model.title
            , stringToPtag "subtitle" model.subTitle
            ]
        ]


heroFooter : HeroModel -> Html Msg
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


spanGen : Int -> Html Msg
spanGen _ =
    Html.span [] []


navBarBurger : Html Msg
navBarBurger =
    let
        s =
            List.map spanGen (List.repeat 4 1)
    in
    Html.span [ Attr.class "navbar-burger" ] s


navBarLogo : NavBarModel -> Html Msg
navBarLogo model =
    Html.a [ Attr.class "navbar-item" ]
        [ Html.img
            [ Attr.src model.image
            , Attr.width model.width
            ]
            []
        ]


navBarBrand : NavBarModel -> Html Msg
navBarBrand model =
    Html.div [ Attr.class "navbar-brand" ]
        [ navBarLogo model
        , navBarBurger
        ]


navBar : NavBarModel -> Html Msg
navBar model =
    Html.header [ Attr.class "navbar" ]
        [ Html.div [ Attr.class "container" ]
            [ navBarBrand model
            , navBarMenu model
            ]
        ]


stringToAtag : String -> String -> Html Msg
stringToAtag className value =
    Html.a [ Attr.class className ]
        [ Html.text value ]


stringToPtag : String -> String -> Html Msg
stringToPtag className value =
    Html.p [ Attr.class className ]
        [ Html.text value ]


stringToLitag : String -> String -> Html Msg
stringToLitag className value =
    Html.li [ Attr.class className ]
        [ Html.text value ]


gitHubButton : Html Msg
gitHubButton =
    Html.span [ Attr.class "navbar-item" ]
        [ Html.a [ Attr.class "button is-success is-inverted" ]
            [ Html.span [ Attr.class "icon" ]
                [ Html.i [ Attr.class "fab fa-github" ] []
                ]
            , Html.span
                []
                [ Html.text "Download" ]
            ]
        ]


navBarMenu : NavBarModel -> Html Msg
navBarMenu model =
    Html.div [ Attr.class "navbar-menu" ]
        [ Html.div [ Attr.class "navbar-end" ]
            [ stringToAtag "navbar-item is-active" "Home"
            , stringToAtag "navbar-item " "Examples"
            , stringToAtag "navbar-item " "Documents"
            , gitHubButton
            ]
        ]
