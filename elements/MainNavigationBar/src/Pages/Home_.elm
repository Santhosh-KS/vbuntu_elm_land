module Pages.Home_ exposing (Model, Msg, page)

import Components.Image as CImg
import Components.Navbar.Brand as CNB
import Components.Navbar.Menu as CNM exposing (Menu)
import Components.Navbar.NavMain as CNN
import Effect exposing (Effect)
import Html exposing (Html)
import Html.Attributes as Attr
import NavItems exposing (..)
import Page exposing (Page)
import Route exposing (Route)
import Shared
import View exposing (View)


bImg : CImg.Image msg
bImg =
    CImg.new { src = "./assets/vbuntuText1080X260.png", altText = "vbuntu logo" }


brand : CNB.Brand msg
brand =
    CNB.new { image = bImg } |> CNB.withImageLink "https://vbuntu.org"


navMenu : Model -> CNM.Menu NavItems.MenuItems Msg
navMenu model =
    CNM.new
        { items = NavItems.list
        , model = model.menuModel
        , toString = NavItems.toString
        , toMsg = MenuItemSelected
        }


navMain : Model -> CNN.Navbar NavItems.MenuItems Msg
navMain model =
    CNN.new { brand = Just brand } |> CNN.withMenu (navMenu model)


page : Shared.Model -> Route () -> Page Model Msg
page shared route =
    Page.new
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- INIT


type alias Model =
    { menuModel : CNM.Model NavItems.MenuItems
    }


defalutNavItem : CNM.Model MenuItems
defalutNavItem =
    CNM.init
        { currentItem = NavItems.Home
        }


init : () -> ( Model, Effect Msg )
init () =
    ( { menuModel = defalutNavItem
      }
    , Effect.none
    )



-- UPDATE


type Msg
    = MenuItemSelected (CNM.Msg NavItems.MenuItems Msg)


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        MenuItemSelected innerMsg ->
            CNM.update
                { msgMIM = innerMsg
                , model = defalutNavItem
                , toModel = \m -> { model | menuModel = m }
                , toMsg = MenuItemSelected
                }



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> View Msg
view model =
    { title = "Home"
    , body =
        [ Html.div [ Attr.class "container" ]
            [ Html.div [ Attr.class "navbar" ]
                [ navMain model |> CNN.view
                ]
            ]

        -- , model |> Debug.toString |> Html.text
        ]
    }
