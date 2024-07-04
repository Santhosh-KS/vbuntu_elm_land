module Components.Card exposing
    ( Card
    , new
    , view
    , withContent
    , withFooter
    , withHeaderIcon
    , withImage
    )

import Components.Content as Content
import Components.Icon as CI
import Components.Image as CImg
import Html
import Html.Attributes as Attr


type Card msg
    = Settings
        { headerTitle : String
        , headerIcon : Maybe (CI.Icon msg)
        , image : Maybe (CImg.Image msg)
        , content : Maybe (Content.Content msg)
        , footer : List String
        }


new : { title : String } -> Card msg
new props =
    Settings
        { headerTitle = props.title
        , headerIcon = Nothing
        , image = Nothing
        , content = Nothing
        , footer = []
        }


withFooter : List String -> Card msg -> Card msg
withFooter ls (Settings settings) =
    Settings
        { settings
            | footer = ls
        }


withImage : CImg.Image msg -> Card msg -> Card msg
withImage img (Settings settings) =
    Settings { settings | image = Just img }


withContent : Content.Content msg -> Card msg -> Card msg
withContent content (Settings settings) =
    Settings { settings | content = Just content }


withHeaderIcon : CI.Icon msg -> Card msg -> Card msg
withHeaderIcon icons (Settings settings) =
    Settings
        { settings
            | headerIcon = Just icons
        }


view : Card msg -> Html.Html msg
view (Settings settings) =
    let
        img =
            case settings.image of
                Just image ->
                    Html.div [ Attr.class "card-image" ] [ image |> CImg.view ]

                Nothing ->
                    Html.text ""

        ctnt =
            case settings.content of
                Just cont ->
                    Html.div [ Attr.class "card-content" ] [ cont |> Content.view ]

                Nothing ->
                    Html.text ""

        {- <div class="card">
             <footer class="card-footer">
               <a href="#" class="card-footer-item">Save</a>
               <a href="#" class="card-footer-item">Edit</a>
               <a href="#" class="card-footer-item">Delete</a>
             </footer>
           </div>
        -}
        sTof : String -> Html.Html msg
        sTof s =
            Html.a [ Attr.class "card-footer-item" ] [ Html.text s ]

        ftr : Html.Html msg
        ftr =
            Html.footer [ Attr.class "card-footer" ] (List.map sTof settings.footer)
    in
    Html.div [ Attr.class "card" ]
        [ Html.div [ Attr.class "card-header" ]
            [ Html.div [ Attr.class "card-header-title" ] [ Html.text settings.headerTitle ]
            ]
        , ctnt
        , img
        , ftr
        ]
