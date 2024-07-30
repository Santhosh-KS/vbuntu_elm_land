module Components.Hero exposing (new, BodyElements, )

import Html exposing (Html)
import Html.Attributes as Attr


type alias BodyElements =
    { title : String
    , subtitle : String
    , image : String
    }


type alias Model =
    { heroNavItems : ElementsPair

    {- , body : BodyElements
       , heroFooter : Elements
    -}
    }


type alias ElementsPair =
    { elements : List ( String, Bool ) }


type Hero item msg
    = HeroSettings
        { body : BodyElements
        }


new : { body : BodyElements } -> Hero item msg
new props =
    HeroSettings
        { body = props.body
        }


withBodyElements : BodyElements -> Hero item msg -> Hero item msg
withBodyElements bodyElem (HeroSettings e) =
    HeroSettings { e | body = bodyElem }


view : Hero item msg -> Html msg
view (HeroSettings h) =
    body h.body



-- head h


head : Hero item msg -> Html msg
head m =
    Html.div [ Attr.class "hero-head" ]
        [ navbar m
        ]


navbar : Hero item msg -> Html msg
navbar (HeroSettings model) =
    Html.nav [ Attr.class "navbar" ]
        [ Html.div [ Attr.class "container" ]
            [ brand

            -- , Html.div [ Attr.class "navbar-menu " ] [ heroNavItems model.heroNavItems.elements ]
            ]
        ]


heroNavItems : List ( String, Bool ) -> Html msg
heroNavItems items =
    let
        ni : List (Html msg)
        ni =
            List.map aTagItems items

        nis =
            List.append ni [ navSpanButton ]
    in
    Html.div [ Attr.class "navbar-end" ] nis


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


brand : Html msg
brand =
    Html.div [ Attr.class "navbar-brand" ]
        [ Html.a [ Attr.class "navbar-item" ]
            [ brandImage
            ]

        -- , burger
        ]


brandImage : Html msg
brandImage =
    Html.img
        [ Attr.src "./assets/vbuntuText1080X260.png"
        , Attr.alt "logo"
        ]
        []


body : BodyElements -> Html msg
body e =
    Html.div [ Attr.class "hero-body" ]
        [ Html.div [ Attr.class "container has-text-centered" ]
            [ Html.p [ Attr.class "title" ] [ Html.text e.title ]
            , Html.p [ Attr.class "subtitle" ] [ Html.text e.subtitle ]
            ]
        ]



{- liTagItem : ( String, Bool ) -> Html msg
   liTagItem ( item, isActive ) =
       Html.li
           [ Attr.classList [ ( "is-active", isActive ) ]
           ]
           [ Html.text item ]
-}
{- heroFooter : Model -> Html msg
   heroFooter model =
       Html.div [ Attr.class "hero-foot" ]
           [ Html.nav [ Attr.class "tabs is-boxed is-fullwidth" ]
               [ Html.div [ Attr.class "container" ]
                   [ Html.ul []
                       (List.map liTagItem model.heroFooter.elements)
                   ]
               ]
           ]
-}


hero : Hero item msg -> Html msg
hero (HeroSettings model) =
    Html.section [ Attr.class "hero is-success is-medium" ]
        [ -- head model
          body model.body

        -- , heroFooter model
        ]



{- burger : Html msg
   burger =
       Html.span [ Attr.class "navbar-burger" ]
           [ Html.span [] []
           , Html.span [] []
           , Html.span [] []
           , Html.span [] []
           ]
-}
