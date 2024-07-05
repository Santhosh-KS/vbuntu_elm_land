module Components.Hero.Head exposing (Head)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events


type Head msg
    = Settings
        { navBar : String -- TODO: make it navbar
        }



{- type alias HeroModel =
       { image : String
       , title : String
       , subTitle : String

       -- , navBarModel : NavBarModel
       }


   heroContent : HeroModel
   heroContent =
       { image = "./assets/trophyLogo.png"
       , title = ""
       , subTitle = "A Community for Creative Engineers.."
       , navBarModel = { image = "./assets/vbuntuText1080X260.png", width = 120, menuItems = [ "Home", "Examples", "Documentation" ] }
       }


   heroHead : HeroModel -> Html.Html Msg
   heroHead model =
       Html.div [ Attr.class "hero-head" ] [ navBar model.navBarModel ]


   hero : HeroModel -> Html.Html Msg
   hero model =
       Html.section [ Attr.class "hero is-primary " ]
           -- Html.section [ Attr.class "hero is-primary is-fullheight " ]
           [ heroHead model
           , heroBody model
           , heroFooter model
           ]


   testingHeroImg : String -> Html.Html msg
   testingHeroImg src =
       CImg.new
           { src = src
           , altText = "Hero image"
           }
           -- |> CImg.with3by4
           |> CImg.view


   heroBody : HeroModel -> Html.Html Msg
   heroBody model =
       Html.div [ Attr.class "hero-body" ]
           [ Html.div [ Attr.class "container has-text-centered" ]
               [ testingHeroImg model.image

               -- Html.img [ Attr.src model.image ] []
               , stringToPtag "title" model.title
               , stringToPtag "subtitle" model.subTitle
               ]
           ]


   heroFooter : HeroModel -> Html.Html Msg
   heroFooter model =
       Html.div [ Attr.class "hero-footer" ]
           [ Html.nav [ Attr.class "tabs is-boxed is-fullwidth" ]
               [ Html.div [ Attr.class "container" ]
                   [ Html.ul []
                       [ Html.li [ Attr.class "is-active" ] [ stringToAtag "" "Overview" ]
                       , Html.li [] [ stringToAtag "" "Grid" ]
                       , Html.li [] [ stringToAtag "" "Elements" ]
                       , Html.li [] [ stringToAtag "" "Components" ]
                       , Html.li [] [ stringToAtag "" "Layouts" ]
                       ]
                   ]
               ]
           ]
-}
