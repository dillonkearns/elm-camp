module Page.Home exposing (parsedMarkup, view)

import Dimensions exposing (Dimensions)
import Element exposing (Element)
import Element.Background as Background
import Element.Border
import Element.Font
import Html
import Html.Attributes exposing (attribute, class, style)
import Mark
import MarkParser
import Style exposing (fontSize, fonts, palette)
import View.FontAwesome


view : Element.Element msg
view =
    parsedMarkup
        |> (\result ->
                case result of
                    Err message ->
                        Element.text <|
                            Debug.toString message

                    Ok element ->
                        element identity
           )


parsedMarkup =
    markupBody
        |> Mark.parse MarkParser.document


markupBody : String
markupBody =
    """| Title
    elm-camp
Want to master the tools that make Elm live up to its promise that "if it compiles, it works"? At Elm camp, you'll get 3 days of jam packed learning, led by the authors of some of Elm's most exciting libraries.

| Header
    Be the First to Find Out!

There are limited seats! If you sign up here, you'll be the first to know when you can get your tickets, and we'll give you a special discount as thanks for showing your enthusiasm!

<>

| Signup
    Hello!

<>

| Header
    The Trainers

| Trainer
    name = Matt Griffith
    imageUrl = /assets/matt.jpg
    bio = Matt is the author of the popular Elm UI library. Elm UI is known for making it as delightful to create your views as it is to write any other Elm code. More impressively, it even makes refactoring and changing your views delightful and reliable!

| Trainer
    name = Dillon Kearns
    imageUrl = /assets/dillon.jpg
    bio = Dillon is the author of elm-graphql, the library that lets you write type-safe server requests that "just work as soon as it compiles™".
"""
