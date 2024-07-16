module Components.Image exposing
    ( Image
    , Model
    , Msg(..)
    , Position(..)
    , init
    , update
    , view
    , withOnClick
    , withPosition
    )

import Effect exposing (Effect)
import Html exposing (..)
import Html.Attributes as Attr exposing (..)


type Image item msg
    = Image
        { model : Model item msg
        , onClick : msg
        }


type Model item msg
    = ImageModel
        { src : String -- TODO: Make src as URL
        , altText : String
        , size : Size
        , position : Position
        }


withOnClick : msg -> Image item msg -> Image item msg
withOnClick ms (Image img) =
    Image { img | onClick = ms }


type Msg item msg
    = OnImageClicked


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
            OnImageClicked ->
                ( props.innerModel, Effect.sendMsg (props.innerMsg |> props.toMsg) )


withPosition : Position -> Image item msg -> Image item msg
withPosition p (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | position = p } }


type Position
    = Left
    | Right
    | Centered


init : { src : String, altText : String, onClick : msg } -> Image item msg
init props =
    Image
        { model =
            ImageModel
                { src = props.src
                , altText = props.altText
                , size = Default
                , position = Left
                }
        , onClick = props.onClick
        }


view : Image item msg -> Html msg
view (Image image) =
    let
        (ImageModel img) =
            image.model
    in
    Html.img
        [ -- Html.Events.onClick OnImageClicked,
          Attr.classList
            [ ( "is-128x128", img.size == IS128x128 )
            , ( "is-16by9", img.size == IS16by9 )
            , ( "is-16x16", img.size == IS16x16 )
            , ( "is-1by1", img.size == IS1by1 )
            , ( "is-1by2", img.size == IS1by2 )
            , ( "is-1by3", img.size == IS1by3 )
            , ( "is-24x24", img.size == IS24x24 )
            , ( "is-2by1", img.size == IS2by1 )
            , ( "is-2by3", img.size == IS2by3 )
            , ( "is-32x32", img.size == IS32x32 )
            , ( "is-3by1", img.size == IS3by1 )
            , ( "is-3by2", img.size == IS3by2 )
            , ( "is-3by4", img.size == IS3by4 )
            , ( "is-3by5", img.size == IS3by5 )
            , ( "is-48x48", img.size == IS48x48 )
            , ( "is-4by3", img.size == IS4by3 )
            , ( "is-4by5", img.size == IS4by5 )
            , ( "is-5by3", img.size == IS5by3 )
            , ( "is-5by4", img.size == IS5by4 )
            , ( "is-64x64", img.size == IS64x64 )
            , ( "is-96x96", img.size == IS96x96 )
            , ( "is-9by6", img.size == IS9by16 )
            , ( "is-square", img.size == ISSquare )
            , ( "has-text-centered", img.position == Centered )
            , ( "has-text-left", img.position == Left )
            , ( "has-text-right", img.position == Right )
            ]
        , Attr.src img.src
        , Attr.alt img.altText
        ]
        []


type Size
    = Default
    | IS128x128
    | IS16by9
    | IS16x16
    | IS1by1
    | IS1by2
    | IS1by3
    | IS24x24
    | IS2by1
    | IS2by3
    | IS32x32
    | IS3by1
    | IS3by2
    | IS3by4
    | IS3by5
    | IS48x48
    | IS4by3
    | IS4by5
    | IS5by3
    | IS5by4
    | IS64x64
    | IS96x96
    | IS9by16
    | ISSquare
    | ISCircle


with128x128 : Image item msg -> Image item msg
with128x128 (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = IS128x128 } }


with16by9 : Image item msg -> Image item msg
with16by9 (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = IS16by9 } }


with16x16 : Image item msg -> Image item msg
with16x16 (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = IS16x16 } }


with1by1 : Image item msg -> Image item msg
with1by1 (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = IS1by1 } }


with1by2 : Image item msg -> Image item msg
with1by2 (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = IS1by2 } }


with1by3 : Image item msg -> Image item msg
with1by3 (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = IS1by3 } }


with24x24 : Image item msg -> Image item msg
with24x24 (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = IS24x24 } }


with2by1 : Image item msg -> Image item msg
with2by1 (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = IS2by1 } }


with2by3 : Image item msg -> Image item msg
with2by3 (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = IS2by3 } }


with32x32 : Image item msg -> Image item msg
with32x32 (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = IS32x32 } }


with3by1 : Image item msg -> Image item msg
with3by1 (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = IS3by1 } }


with3by2 : Image item msg -> Image item msg
with3by2 (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = IS3by2 } }


with3by4 : Image item msg -> Image item msg
with3by4 (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = IS3by4 } }


with3by5 : Image item msg -> Image item msg
with3by5 (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = IS3by5 } }


with48x48 : Image item msg -> Image item msg
with48x48 (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = IS48x48 } }


with4by3 : Image item msg -> Image item msg
with4by3 (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = IS4by3 } }


with4by5 : Image item msg -> Image item msg
with4by5 (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = IS4by5 } }


with5by3 : Image item msg -> Image item msg
with5by3 (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = IS5by3 } }


with5by4 : Image item msg -> Image item msg
with5by4 (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = IS5by4 } }


with64x64 : Image item msg -> Image item msg
with64x64 (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = IS64x64 } }


with96x96 : Image item msg -> Image item msg
with96x96 (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = IS96x96 } }


with9by16 : Image item msg -> Image item msg
with9by16 (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = IS9by16 } }


withCircle : Image item msg -> Image item msg
withCircle (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = ISCircle } }


withSquare : Image item msg -> Image item msg
withSquare (Image img) =
    let
        (ImageModel m) =
            img.model
    in
    Image { img | model = ImageModel { m | size = ISSquare } }
