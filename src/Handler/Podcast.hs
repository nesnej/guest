{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
module Handler.Podcast where

import Import

getPodcastR :: Handler Html
getPodcastR = defaultLayout $ do
    let randomName = "Big Baller Shot Caller Josh" :: String
    let podcasts = ['a', 'b'..'z'] :: [Char]
    $(widgetFile "podcasts")