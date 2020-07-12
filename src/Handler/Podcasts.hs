{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Podcasts where

import Import

getPodcastsR :: Handler Html
getPodcastsR = defaultLayout $ do
        let bestVar = "What are you doing" :: String
        let thePods = ["podcast1", "podcast2", "podcast3"] :: [String]
        $(widgetFile "podcasts")