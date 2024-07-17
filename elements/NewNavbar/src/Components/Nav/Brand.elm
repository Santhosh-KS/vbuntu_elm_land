module Components.Nav.Brand exposing
    ( Brand
    , Model
    , Msg
    , init
    , new
    , update
    , view
    , withImage
    )

import Components.Image as CI
import Effect exposing (Effect)
import Html exposing (Html)
import Html.Attributes as Attr
import Html.Events


type Brand item msg
    = Brand
        { model : Model item msg
        }


new : Model item msg -> Brand item msg
new model =
    Brand { model = model }


type Model item msg
    = BrandModel
        { imageModel : CI.Model item msg
        , onClick : msg
        }


type Msg item msg
    = OnBrandImageClicked



-- INIT


init : { imageModel : CI.Model item msg, onClick : msg } -> Model item msg
init props =
    BrandModel { imageModel = props.imageModel, onClick = props.onClick }


withImage : CI.Image item msg -> Brand item msg -> Brand item msg
withImage (CI.Image img) (Brand brand) =
    let
        (BrandModel m) =
            brand.model
    in
    Brand { brand | model = BrandModel { m | imageModel = img.model } }



-- VIEW


view : Brand item msg -> Html msg
view (Brand brand) =
    let
        (BrandModel bm) =
            brand.model
    in
    Html.div [ Attr.class "navbar-brand" ]
        [ Html.a
            [ Attr.class "navbar-item"
            , Html.Events.onClick bm.onClick
            ]
            [ { model = bm.imageModel } |> CI.new >> CI.view ]
        ]



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
