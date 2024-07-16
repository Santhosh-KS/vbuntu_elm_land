module Components.Nav.Navbar exposing
    ( Model
    , Msg
    , Navbar
    , init
    , new
    , update
    , view
    )

import Components.Nav.Brand as CNB
import Effect exposing (Effect)
import Html exposing (Html)
import Html.Attributes as Attr
import Html.Events


type Navbar item msg
    = Navbar
        { model : Model item msg
        }


type Msg item msg
    = OnBrandImageClicked



-- NEW


new : { model : Model item msg, onClick : msg } -> Navbar item msg
new props =
    Navbar { model = props.model }


type Model item msg
    = NavbarModel
        { brandModel : CNB.Model item msg
        , onClick : msg
        }



--UPDATE


update :
    { innerMsg : Msg item msg
    , innerModel : Model item msg
    , toModel : Model item msg -> model
    , toMsg : Msg item msg -> msg
    }
    -> ( model, Effect msg )
update props =
    let
        toParent : ( Model item msg, Effect msg ) -> ( model, Effect msg )
        toParent ( model, effect ) =
            ( model |> props.toModel, effect )
    in
    toParent <|
        case props.innerMsg of
            OnBrandImageClicked ->
                ( props.innerModel, Effect.sendMsg (props.innerMsg |> props.toMsg) )


init : { brandModel : CNB.Model item msg, onClick : msg } -> Model item msg
init props =
    NavbarModel { brandModel = props.brandModel, onClick = props.onClick }



{- init : { brand : CNB.Model item msg, onClick : msg } -> Model item msg
   init props =
       NavbarModel { brand = props.brand, onClick = props.onClick }
-}


view : Navbar item msg -> Html msg
view (Navbar nav) =
    let
        (NavbarModel m) =
            nav.model

        brand =
            { model = m.brandModel } |> CNB.new >> CNB.view
    in
    Html.nav
        [ Attr.class "navbar navigation"
        , Html.Events.onClick m.onClick
        ]
        [ brand ]
