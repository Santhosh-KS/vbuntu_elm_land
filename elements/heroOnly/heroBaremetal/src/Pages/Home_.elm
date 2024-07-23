module Pages.Home_ exposing (Model, Msg, page)

import Effect exposing (Effect)
import Html exposing (Html)
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


type alias HeroBodyElements =
    { title : String
    , subtitle : String
    }


type alias Elements =
    { elements : List ( String, Bool ) }


type alias Model =
    { navItems : Elements
    , heroBody : HeroBodyElements
    , heroFooter : Elements
    }


init : () -> ( Model, Effect Msg )
init () =
    ( { navItems =
            { elements =
                [ ( "Home", True )
                , ( "Documents", False )
                , ( "Example", False )
                ]
            }
      , heroBody = { title = "Title", subtitle = "subtitle" }
      , heroFooter =
            { elements =
                [ ( "Overview", True )
                , ( "Modifier", False )
                , ( "Example", False )
                , ( "Documentation", False )
                , ( "Help", False )
                , ( "Test", False )
                ]
            }
      }
    , Effect.none
    )



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        NoOp ->
            ( model
            , Effect.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> View Msg
view model =
    { title = "Home"
    , body = [ hero model ]
    }


heroHead : Model -> Html msg
heroHead m =
    Html.div [ Attr.class "hero-head" ]
        [ navbar m
        ]


heroBody : HeroBodyElements -> Html msg
heroBody e =
    Html.div [ Attr.class "hero-body" ]
        [ Html.div [ Attr.class "container has-text-centered" ]
            [ Html.p [ Attr.class "title" ] [ Html.text e.title ]
            , Html.p [ Attr.class "subtitle" ] [ Html.text e.subtitle ]
            ]
        ]


liTagItem : ( String, Bool ) -> Html msg
liTagItem ( item, isActive ) =
    Html.li
        [ Attr.classList [ ( "is-active", isActive ) ]
        ]
        [ Html.text item ]


heroFooter : Model -> Html msg
heroFooter model =
    Html.div [ Attr.class "hero-foot" ]
        [ Html.nav [ Attr.class "tabs is-boxed is-fullwidth" ]
            [ Html.div [ Attr.class "container" ]
                [ Html.ul []
                    (List.map liTagItem model.heroFooter.elements)
                ]
            ]
        ]


hero : Model -> Html msg
hero model =
    Html.section [ Attr.class "hero is-success is-medium" ]
        [ heroHead model
        , heroBody model.heroBody
        , heroFooter model
        ]


burger : Html msg
burger =
    Html.span [ Attr.class "navbar-burger" ]
        [ Html.span [] []
        , Html.span [] []
        , Html.span [] []
        , Html.span [] []
        ]


brandImage : Html msg
brandImage =
    Html.img
        [ Attr.src "./assets/vbuntuText1080X260.png"
        , Attr.alt "logo"
        ]
        []


brand : Html msg
brand =
    Html.div [ Attr.class "navbar-brand" ]
        [ Html.a [ Attr.class "navbar-item" ]
            [ brandImage
            ]
        , burger
        ]


navSpanButton : Html msg
navSpanButton =
    Html.span [ Attr.class "navbar-item" ]
        [ Html.a [ Attr.class "button is-primary is-inverted" ]
            [ Html.span [ Attr.class "icon" ]
                [ Html.i [ Attr.class "fab fa-github" ] []
                ]
            , Html.span [] [ Html.text "Download" ]
            ]
        ]


aTagItems : ( String, Bool ) -> Html msg
aTagItems ( item, isActive ) =
    Html.a
        [ Attr.class "navbar-item"
        , Attr.classList [ ( "is-active", isActive ) ]
        ]
        [ Html.text item ]


navItems : List ( String, Bool ) -> Html msg
navItems items =
    let
        ni : List (Html msg)
        ni =
            List.map aTagItems items

        nis =
            List.append ni [ navSpanButton ]
    in
    Html.div [ Attr.class "navbar-end" ] nis


navbar : Model -> Html msg
navbar model =
    Html.nav [ Attr.class "navbar" ]
        [ Html.div [ Attr.class "container" ]
            [ brand
            , Html.div [ Attr.class "navbar-menu " ] [ navItems model.navItems.elements ]
            ]
        ]
