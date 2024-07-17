module Pages.Home_ exposing (Model, Msg, page)

import Components.Image as CI
import Components.Nav.Brand as CNB
import Components.Nav.Navbar as CNN
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


type alias EmptyItem =
    {}


type alias Model =
    { brandModel : CNB.Model EmptyItem Msg
    , navModel : CNN.Model EmptyItem Msg
    }


init : () -> ( Model, Effect Msg )
init () =
    let
        bm : CNB.Model item Msg
        bm =
            CNB.init
                { imageModel = brandImage
                , onClick = NoOp
                }

        nm : CNN.Model item Msg
        nm =
            CNN.init
                { brandModel = bm
                , onClick = NoOp
                }
    in
    ( { brandModel = bm, navModel = nm }
    , Effect.none
    )



-- UPDATE


type Msg
    = OnBrandImageClicked (CNB.Msg EmptyItem Msg)
    | OnNavBarClicked (CNN.Msg EmptyItem Msg)
    | NoOp


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        OnBrandImageClicked innerMsg ->
            CNB.update
                { innerMsg = innerMsg
                , innerModel = model.brandModel
                , toModel = \bm -> { model | brandModel = bm }
                , toMsg = OnBrandImageClicked
                }

        OnNavBarClicked innerMsg ->
            CNN.update
                { innerMsg = innerMsg
                , innerModel = model.navModel
                , toModel = \nm -> { model | navModel = nm }
                , toMsg = OnNavBarClicked
                }

        NoOp ->
            ( model, Effect.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> View Msg
view model =
    { title = "Pages.Home"
    , body =
        [ viewContainer model
        ]
    }


viewContainer : Model -> Html Msg
viewContainer model =
    Html.div
        [ Attr.class "container"

        -- , Html.Events.onClick NoOp
        ]
        [ model |> navMain |> CNN.view
        ]


brandImage : CI.Model item Msg
brandImage =
    CI.init
        { src = "./assets/vbuntuText1080X260.png"
        , altText = "Vbuntu brand logo in Nav bar."
        , onClick = NoOp
        }



{- brand : Model -> CNB.Brand EmptyItem Msg
   brand m =
       CNB.new { model = m.brandModel }
-}


navMain : Model -> CNN.Navbar EmptyItem Msg
navMain m =
    CNN.new { model = m.navModel }
