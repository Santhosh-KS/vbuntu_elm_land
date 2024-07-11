module Components.Navbar.Menu exposing
    ( Menu
    , Model
    , Msg(..)
    , init
    , new
    , update
    , view
    )

import Effect exposing (Effect)
import Html exposing (Html)
import Html.Attributes as Attr
import Html.Events


type Menu item msg
    = Menu
        { model : Model item
        , items : List item
        , toString : item -> String
        , onChange : Maybe (item -> msg)
        , toMsg : Msg item msg -> msg
        }


type Model item
    = Model
        { currentItem : item
        }


init : { currentItem : item } -> Model item
init props =
    Model { currentItem = props.currentItem }


type Msg item msg
    = OnClicked item
    | Selected { item : item, onChange : Maybe msg }


update :
    { msgMIM : Msg item msg
    , model : Model item
    , toModel : Model item -> model
    , toMsg : Msg item msg -> msg
    }
    -> ( model, Effect msg )
update props =
    let
        (Model model) =
            props.model

        toParentModel : ( Model item, Effect msg ) -> ( model, Effect msg )
        toParentModel ( innermodel, effect ) =
            ( props.toModel innermodel, effect )
    in
    toParentModel <|
        case props.msgMIM of
            Selected data ->
                ( Model { model | currentItem = data.item }
                , case data.onChange of
                    Just onChange ->
                        Effect.sendMsg onChange

                    Nothing ->
                        Effect.none
                )

            OnClicked i ->
                ( Model { model | currentItem = i }, Effect.none )


new :
    { items : List item
    , model : Model item
    , toString : item -> String
    , toMsg : Msg item msg -> msg
    }
    -> Menu item msg
new props =
    Menu
        { items = props.items
        , model = props.model
        , onChange = Nothing
        , toString = props.toString
        , toMsg = props.toMsg
        }


view : Menu item msg -> Html msg
view (Menu s) =
    let
        miToi : Model item -> item
        miToi (Model m) =
            m.currentItem

        isSelectedItem : item -> item -> ( String, Bool, item )
        isSelectedItem i1 i2 =
            ( s.toString i2, i1 == i2, i2 )

        lss =
            List.map (s.model |> miToi |> isSelectedItem) s.items

        toHtmlMsg : ( String, Bool, item ) -> Html msg
        toHtmlMsg ( str, flag, selection ) =
            Html.a
                [ Attr.class "navbar-item "
                , Attr.classList
                    [ ( "is-active", flag )
                    ]
                , Html.Events.onClick (s.toMsg (OnClicked selection))

                -- , Html.Events.onClick (selection |> OnClicked |> s.toMsg)
                ]
                [ Html.text str ]
    in
    Html.div
        [ Attr.class "navbar-menu"
        ]
        [ Html.div
            [ Attr.class "navbar-end "
            ]
            (List.map toHtmlMsg lss)
        ]
