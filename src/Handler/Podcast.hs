{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Podcast where

import Import

getPodcastR :: String -> Handler Html
getPodcastR name = defaultLayout $ do
    $(widgetFile "podcast")




