module Components.Content exposing
    ( Content
    , new
    , view
    )

import Html exposing (..)
import Html.Attributes as Attr


type Content msg
    = Settings
        { content : String
        }


new : { content : String } -> Content msg
new props =
    Settings { content = props.content }


view : Content msg -> Html msg
view (Settings settings) =
    Html.div [ Attr.class "content" ] [ Html.text settings.content ]
