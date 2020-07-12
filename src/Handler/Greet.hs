{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE  QuasiQuotes#-}
module Handler.Greet where

import Import

getGreetR :: Handler Html
getGreetR = do
    defaultLayout $ do
        setTitle "Hello there!"
        [whamlet|<p>Hello there!|]