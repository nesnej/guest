{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Podcast where

import Import

getPodcastR :: String -> Handler Html
getPodcastR name = do
    allPodcasts <- runDB $ getAllPodcasts

    defaultLayout $ do $(widgetFile "podcast")

postPodcastR :: String -> Handler Value
postPodcastR name = do
    -- requireCheckJsonBody will parse the request body into the appropriate type, or return a 400 status code if the request JSON is invalid.
    -- (The ToJSON and FromJSON instances are derived in the config/models file).
    podcast <- (requireCheckJsonBody :: Handler Podcast)

    -- The YesodAuth instance in Foundation.hs defines the UserId to be the type used for authentication.
    --maybeCurrentUserId <- maybeAuthId
    --let comment' = comment { commentUserId = maybeCurrentUserId }

    insertedPodcast <- runDB $ insertEntity podcast
    returnJson insertedPodcast

getAllPodcasts :: DB [Entity Podcast]
getAllPodcasts = selectList [] [Asc PodcastId]
