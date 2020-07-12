{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Podcasts where

import Import

import Import
import Yesod.Form.Bootstrap3 (BootstrapFormLayout (..), renderBootstrap3)
import Text.Julius (RawJS (..))

-- Define our data that will be used for creating the form.
data FileForm = FileForm
    { fileInfo :: FileInfo
    , fileDescription :: Text
    }


getPodcastsR :: Text -> Handler Html
getPodcastsR name = defaultLayout $ do
    let bestVar = "What are you doing" :: String
    let thePods = ["podcast1", "podcast2", "podcast3"] :: [String]
    $(widgetFile "podcasts")