module Components.Dropdown exposing
    ( Dropdown
    , Model
    , Msg
    , init
    , new
    , update
    , view
    , withOnChange
    )

import Effect exposing (Effect)
import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events as HEvents exposing (..)


type Dropdown item msg
    = Settings
        { model : Model item
        , toMsg : Msg item msg -> msg
        , choices : List item
        , toLabel : item -> String
        , size : Size
        , isDisabled : Bool
        , onChange : Maybe (item -> msg)
        }


new :
    { model : Model item
    , toMsg : Msg item msg -> msg
    , choices : List item
    , toLabel : item -> String
    }
    -> Dropdown item msg
new props =
    Settings
        { model = props.model
        , toMsg = props.toMsg
        , choices = props.choices
        , toLabel = props.toLabel
        , size = Normal
        , isDisabled = False
        , onChange = Nothing
        }


type Size
    = Normal
    | Small


withSizeSmall : Dropdown item msg -> Dropdown item msg
withSizeSmall (Settings settings) =
    Settings { settings | size = Small }


withDisabled : Dropdown item msg -> Dropdown item msg
withDisabled (Settings settings) =
    Settings { settings | isDisabled = True }


withOnChange :
    (item -> msg)
    -> Dropdown item msg
    -> Dropdown item msg
withOnChange onChange (Settings settings) =
    Settings { settings | onChange = Just onChange }



-- MODEL


type Model item
    = Model
        { selected : item
        , isMenuOpen : Bool
        }


init : { selected : item } -> Model item
init props =
    Model
        { selected = props.selected
        , isMenuOpen = False
        }



-- UPDATE


type Msg item msg
    = OnDropdownClicked item
    | SelectedItem
        { item : item
        , onChange : Maybe msg
        }


update :
    { msg : Msg item msg
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
        toParentModel ( innerModel, effect ) =
            ( props.toModel innerModel
            , effect
            )

        toParentModelWithNone : Model item -> ( model, Effect msg )
        toParentModelWithNone m =
            ( props.toModel m, Effect.none )
    in
    case props.msg of
        SelectedItem data ->
            ( Model
                { model
                    | isMenuOpen = False
                    , selected = data.item
                }
            , case data.onChange of
                Just onChange ->
                    Effect.sendMsg onChange

                Nothing ->
                    Effect.none
            )
                |> toParentModel

        OnDropdownClicked item ->
            Model { model | isMenuOpen = True, selected = item } |> toParentModelWithNone



-- VIEW


view : Dropdown item msg -> Html msg
view (Settings settings) =
    let
        (Model model) =
            settings.model

        onMenuItemClick : item -> msg
        onMenuItemClick item =
            settings.toMsg <|
                case settings.onChange of
                    Just onChange ->
                        SelectedItem
                            { item = item
                            , onChange = Just (onChange item)
                            }

                    Nothing ->
                        SelectedItem
                            { item = item
                            , onChange = Nothing
                            }
    in
    Html.div
        [ Attr.class "dropdown "
        , Attr.classList [ ( "is-active", model.isMenuOpen ) ]
        ]
        [ Html.div [ Attr.class "dropdown-trigger" ]
            [ Html.button
                [ Attr.class "button"
                , HEvents.onClick (model.selected |> OnDropdownClicked |> settings.toMsg)
                ]
                [ Html.span [] [ Html.text (model.selected |> settings.toLabel) ]

                -- , Html.span [] [Html.text "Put some icon"]
                ]
            ]
        , Html.div
            [ Attr.class "dropdown-menu"
            ]
            [ Html.div
                [ Attr.class "dropdown-content"
                , HEvents.onClick (model.selected |> onMenuItemClick)
                ]
                (List.map
                    (settings.toLabel >> stringToAtag)
                    settings.choices
                )
            ]
        ]


type DdModel item msg
    = ModelSettings
        { buttonText : String
        , menuItems : List String
        }


stringToAtag : String -> Html msg
stringToAtag val =
    Html.a [ Attr.class "dropdown-item ", Attr.href "#" ] [ Html.text val ]


dm : DdModel item msg -> Html msg
dm (ModelSettings model) =
    Html.div [ Attr.class "dropdown is-active" ]
        [ Html.div [ Attr.class "dropdown-trigger" ]
            [ Html.button [ Attr.class "button" ]
                [ Html.span [] [ Html.text model.buttonText ]

                -- , Html.span [] [Html.text "Put some icon"]
                ]
            ]
        , Html.div
            [ Attr.class "dropdown-menu"
            ]
            [ Html.div [ Attr.class "dropdown-content" ]
                (List.map
                    stringToAtag
                    model.menuItems
                )
            ]
        ]
