module Components.Navbar.Brand exposing (..)

import Components.Image as CImg
import Html exposing (Html)
import Html.Attributes as Attr


type Brand msg
    = Brand
        { image : CImg.Image msg
        , href : String
        }


new : { image : CImg.Image msg } -> Brand msg
new props =
    Brand { image = props.image, href = "" }


withImageLink : String -> Brand msg -> Brand msg
withImageLink link (Brand s) =
    Brand { s | href = link }


view : Brand msg -> Html msg
view (Brand s) =
    Html.div [ Attr.class "navbar-brand" ]
        [ Html.a
            [ Attr.class "navbar-item"
            , Attr.href s.href
            ]
            [ s.image |> CImg.view ]
        ]
