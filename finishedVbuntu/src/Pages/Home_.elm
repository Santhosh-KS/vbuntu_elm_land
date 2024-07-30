module Pages.Home_ exposing (Model, Msg, page)

-- import Components.Hero exposing (Hero)

import Effect exposing (Effect)
import Html exposing (Html)
import Html.Attributes as Attr
import Page exposing (Page)
import Route exposing (Route)
import Shared
import View exposing (View)


page : Shared.Model -> Route () -> Page Model Msg
page shared route =
    Page.new
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- INIT


type alias HeroBodyElements =
    { title : String
    , subtitle : String
    }


type alias Elements =
    { elements : List ( String, Bool ) }


type alias Model =
    { heroNavItems : Elements
    , heroBody : HeroBodyElements
    , heroFooter : Elements
    }


init : () -> ( Model, Effect Msg )
init () =
    ( { heroNavItems =
            { elements =
                [ ( "Home", True )
                , ( "Documents", False )
                , ( "Example", False )
                ]
            }
      , heroBody = { title = "Title", subtitle = "subtitle" }
      , heroFooter =
            { elements =
                [ ( "Overview", True )
                , ( "Modifier", False )
                , ( "Example", False )
                , ( "Documentation", False )
                , ( "Help", False )
                , ( "Test", False )
                ]
            }
      }
    , Effect.none
    )



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        NoOp ->
            ( model
            , Effect.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> View Msg
view model =
    { title = "Home"
    , body =
        [ hero model
        , content
        , footer
        ]
    }


heroHead : Model -> Html msg
heroHead m =
    Html.div [ Attr.class "hero-head" ]
        [ navbar m
        ]


heroBody : HeroBodyElements -> Html msg
heroBody e =
    Html.div [ Attr.class "hero-body" ]
        [ Html.div [ Attr.class "container has-text-centered" ]
            [ Html.p [ Attr.class "title" ] [ Html.text e.title ]
            , Html.p [ Attr.class "subtitle" ] [ Html.text e.subtitle ]
            ]
        ]


liTagItem : ( String, Bool ) -> Html msg
liTagItem ( item, isActive ) =
    Html.li
        [ Attr.classList [ ( "is-active", isActive ) ]
        ]
        [ Html.text item ]


heroFooter : Model -> Html msg
heroFooter model =
    Html.div [ Attr.class "hero-foot" ]
        [ Html.nav [ Attr.class "tabs is-boxed is-fullwidth" ]
            [ Html.div [ Attr.class "container" ]
                [ Html.ul []
                    (List.map liTagItem model.heroFooter.elements)
                ]
            ]
        ]


hero : Model -> Html msg
hero model =
    Html.section [ Attr.class "hero is-success is-medium" ]
        [ heroHead model
        , heroBody model.heroBody

        -- , heroFooter model
        ]


burger : Html msg
burger =
    Html.span [ Attr.class "navbar-burger" ]
        [ Html.span [] []
        , Html.span [] []
        , Html.span [] []
        , Html.span [] []
        ]


brandImage : Html msg
brandImage =
    Html.img
        [ Attr.src "./assets/vbuntuText1080X260.png"
        , Attr.alt "logo"
        ]
        []


brand : Html msg
brand =
    Html.div [ Attr.class "navbar-brand" ]
        [ Html.a [ Attr.class "navbar-item" ]
            [ brandImage
            ]
        , burger
        ]


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


navbar : Model -> Html msg
navbar model =
    Html.nav [ Attr.class "navbar" ]
        [ Html.div [ Attr.class "container" ]
            [ brand
            , Html.div [ Attr.class "navbar-menu " ] [ heroNavItems model.heroNavItems.elements ]
            ]
        ]



-- content


contentText =
    """
    Our mission is to foster a dynamic environment where engineers from diverse backgrounds come together to exchange knowledge, tackle challenges, and inspire one another.    
    We believe in the power of community-driven learning and the transformative impact it has on both individual growth and the advancement of engineering as a whole.
    """


ksText =
    """
    Dive into a treasure trove of resources ranging from technical articles and tutorials to insightful discussions on the latest industry trends. Our platform is designed to facilitate the exchange of ideas and best practices.
    """


networkingOppertunitiesText =
    "Connect with like-minded professionals and enthusiasts. Forge meaningful relationships, find mentors or mentees, and expand your professional network. "


educationEventsText =
    "Educational Events: Participate in webinars, workshops, and seminars hosted by industry experts. Stay updated on emerging technologies and gain valuable insights from experienced practitioners. Share and inspire the next generation of Engineers, help them build their career and encourage them to be an entrepreneur. Help them build products which will have meaningful positive impact in people’s lives."


skdText =
    "Access tutorials and workshops focused on improving core engineering skills. Enhance your proficiency in software development, PCB design, CAD design, project management, and more."


peerAccountabilityText =
    "Peer Accountability: Join accountability groups within the community to stay motivated and accountable for your goals. Share your progress, celebrate achievements, and receive constructive feedback."


timeManagementText =
    "Time Management: Discover strategies to optimize your workflow and make the most out of your day. From effective task prioritization to leveraging productivity tools, we’ve got you covered."


productivityChallengesText =
    "Productivity Challenges: Participate in productivity challenges designed to cultivate healthy habits and boost efficiency. We help in building systems that are simple, yet powerful enough to be used in any domain; which will help you achive your goals."


ubuntuPhilosophyText =
    "At Vbuntu, we embrace the Ubuntu philosophy—a concept deeply rooted in African culture and widely popularized in the open-source community. Ubuntu emphasizes the interconnectedness of humanity and the principles of compassion, unity, and mutual support. Similarly, our community values reflect these ideals:\n\nInclusivity: We celebrate diversity and welcome individuals from all backgrounds, disciplines, and skill levels. Everyone has a unique perspective to contribute.\n\nRespect: We promote a culture of mutual respect and constructive communication. Treat others with kindness and empathy.\n\nCollaboration: Great things happen when we work together. Collaboration fosters innovation and accelerates progress.\n\nCommunity Building: We believe in building strong, supportive communities where members lift each other up and strive for collective success."


getInvolvedText =
    "Joining our community is easy! Simply sign up to gain access to our forums, events calendar, and exclusive resources. Whether you’re looking to learn, share your expertise, boost productivity, or simply connect with fellow engineers, you’ll find a place here."


contactUs =
    "Have questions or suggestions? We’d love to hear from you! Reach out to us via contact@vbuntu.org and let’s continue building this vibrant engineering community together.\n\nThank you for visiting Vbuntu.org. Let’s embark on this exciting journey of exploration, innovation, productivity, and Ubuntu spirit together!"


getInvolvedHtml =
    Html.div [ Attr.class "columns py-3" ]
        [ Html.div [ Attr.class "column" ]
            [ Html.p [ Attr.class "is-size-4" ] [ Html.text getInvolvedText ]
            ]
        , Html.div [ Attr.class "column" ]
            [ Html.img [ Attr.src "../../assets/joinus.png" ] []
            ]
        ]


boostingProductivityHtml =
    Html.div [ Attr.class "columns py-3" ]
        [ Html.div [ Attr.class "column" ]
            [ Html.p [ Attr.class "title" ] [ Html.text "Skill Development" ]
            , Html.p [ Attr.class "is-size-4" ] [ Html.text skdText ]
            ]
        , Html.div [ Attr.class "column" ]
            [ Html.p [ Attr.class "title" ] [ Html.text "Peer Accountability" ]
            , Html.p [ Attr.class "is-size-4" ] [ Html.text peerAccountabilityText ]
            ]
        , Html.div [ Attr.class "column" ]
            [ Html.p [ Attr.class "title" ] [ Html.text "Time Management" ]
            , Html.p [ Attr.class "is-size-4" ] [ Html.text timeManagementText ]
            ]
        ]


ubuntuPhilosophyHtml =
    Html.div [ Attr.class "columns py-3" ]
        [ Html.div [ Attr.class "column" ]
            [ Html.img [ Attr.src "../../assets/Ubuntu-logo.png" ] []
            ]
        , Html.div [ Attr.class "column" ]
            [ Html.p [ Attr.class "is-size-4" ] [ Html.text ubuntuPhilosophyText ]
            ]
        ]


contactUsHtml =
    Html.div [ Attr.class "columns py-3" ]
        [ Html.div [ Attr.class "column" ]
            [ Html.p [ Attr.class "is-size-4" ] [ Html.text contactUs ]
            ]
        ]


contentHtml =
    Html.div [ Attr.class "columns py-3" ]
        [ Html.div [ Attr.class "column" ]
            [ Html.img
                [ Attr.src "../../assets/nasaMission.jpg"
                , Attr.class "image "
                ]
                []
            ]
        , Html.div [ Attr.class "column" ]
            [ Html.div [ Attr.class "title is-size-1" ] [ Html.text "Mission" ]
            , Html.p [ Attr.class "is-size-4" ] [ Html.text contentText ]
            ]
        ]


ksHtml =
    Html.div [ Attr.class "columns py-3" ]
        [ Html.div [ Attr.class "column" ]
            [ Html.div [ Attr.class "title is-size-1" ] [ Html.text "Knowledge base" ]
            , Html.p [ Attr.class "is-size-4" ] [ Html.text (ksText ++ "\n\n" ++ networkingOppertunitiesText) ]
            ]
        , Html.div [ Attr.class "column" ]
            [ Html.img [ Attr.src "../../assets/kb.jpg" ] []
            ]
        ]


networkingHtml =
    Html.div [ Attr.class "columns py-3" ]
        [ Html.div [ Attr.class "column" ]
            [ Html.img [ Attr.src "../../assets/vbuntuText1080X260.png" ] []
            ]
        , Html.div [ Attr.class "column" ]
            [ Html.p [ Attr.class "is-size-4" ] [ Html.text networkingOppertunitiesText ]
            ]
        ]


footer =
    Html.footer [ Attr.class "footer" ]
        [ Html.div [ Attr.class "content has-text-centered" ]
            [ Html.p []
                [ Html.strong [] [ Html.text "VBUNTU\t" ]
                , Html.a [ Attr.href "https://www.linkedin.com/in/santhosh-k-s-07542623/" ] [ Html.text "\tBy Santhosh K S" ]
                , Html.text "\t Website content is licensed"
                ]
            ]
        ]


content : Html msg
content =
    Html.div [ Attr.class "container py-6" ]
        [ contentHtml
        , ksHtml

        -- , networkingHtml
        , boostingProductivityHtml
        , ubuntuPhilosophyHtml
        , getInvolvedHtml
        , contactUsHtml
        ]
