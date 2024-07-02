module Components.Message exposing
    ( Message
    , new
    , view
    , withCloseButton
    , withSizeLarge
    , withSizeMedium
    , withSizeSmall
    , withStyleDanger
    , withStyleDark
    , withStyleInfo
    , withStyleLink
    , withStylePrimary
    , withStyleSuccess
    , withStyleWarning
    )

import Html exposing (..)
import Html.Attributes as Attr


type Message msg
    = Settings
        { header : String
        , body : String
        , size : Size
        , style : Style
        , hasCloseButton : Bool
        }


new : { header : String, body : String } -> Message msg
new props =
    Settings
        { header = props.header
        , body = props.body
        , size = Normal
        , style = Default
        , hasCloseButton = False
        }


type Size
    = Normal
    | Small
    | Medium
    | Large


type Style
    = Default
    | Dark
    | Link
    | Primary
    | Warning
    | Success
    | Info
    | Danger


withStyleDark : Message msg -> Message msg
withStyleDark (Settings settings) =
    Settings { settings | style = Dark }


withStyleLink : Message msg -> Message msg
withStyleLink (Settings settings) =
    Settings { settings | style = Link }


withStyleInfo : Message msg -> Message msg
withStyleInfo (Settings settings) =
    Settings { settings | style = Info }


withStyleWarning : Message msg -> Message msg
withStyleWarning (Settings settings) =
    Settings { settings | style = Warning }


withStyleSuccess : Message msg -> Message msg
withStyleSuccess (Settings settings) =
    Settings { settings | style = Success }


withStylePrimary : Message msg -> Message msg
withStylePrimary (Settings settings) =
    Settings { settings | style = Primary }


withStyleDanger : Message msg -> Message msg
withStyleDanger (Settings settings) =
    Settings { settings | style = Danger }


withSizeSmall : Message msg -> Message msg
withSizeSmall (Settings settings) =
    Settings { settings | size = Small }


withSizeMedium : Message msg -> Message msg
withSizeMedium (Settings settings) =
    Settings { settings | size = Medium }


withSizeLarge : Message msg -> Message msg
withSizeLarge (Settings settings) =
    Settings { settings | size = Large }


withCloseButton : Message msg -> Message msg
withCloseButton (Settings settings) =
    Settings { settings | hasCloseButton = True }



{- <article class="message is-warning">
     <div class="message-header">
       <p>Warning</p>
       <button class="delete" aria-label="delete"></button>
     </div>
     <div class="message-body">
       Lorem ipsum dolor sit amet, consectetur adipiscing elit.
       <strong>Pellentesque risus mi</strong>, tempus quis placerat ut, porta nec
       nulla. Vestibulum rhoncus ac ex sit amet fringilla. Nullam gravida purus
       diam, et dictum <a>felis venenatis</a> efficitur. Aenean ac
       <em>eleifend lacus</em>, in mollis lectus. Donec sodales, arcu et
       sollicitudin porttitor, tortor urna tempor ligula, id porttitor mi magna a
       neque. Donec dui urna, vehicula et sem eget, facilisis sodales sem.
     </div>
   </article>
-}


view : Message msg -> Html msg
view (Settings settings) =
    let
        closeButton =
            if settings.hasCloseButton then
                Html.button [ Attr.class "delete" ] []

            else
                Html.text ""
    in
    Html.article
        [ Attr.class "message"
        , Attr.classList
            [ ( "", settings.size == Normal )
            , ( "is-small", settings.size == Small )
            , ( "is-medium", settings.size == Medium )
            , ( "is-Large", settings.size == Large )
            , ( "is-primary", settings.style == Primary )
            , ( "is-dark", settings.style == Dark )
            , ( "is-info", settings.style == Info )
            , ( "is-warning", settings.style == Warning )
            , ( "is-success", settings.style == Success )
            , ( "is-link", settings.style == Link )
            , ( "is-danger", settings.style == Danger )
            ]
        ]
        [ Html.div [ Attr.class "message-header" ]
            [ Html.p [] [ Html.text settings.header ]
            , closeButton
            ]
        , Html.div [ Attr.class "message-body" ] [ Html.text settings.body ]
        ]
