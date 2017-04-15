{-# LANGUAGE OverloadedStrings #-}

module Jira where

import Data.Monoid ((<>))
import Network.Wreq (Options, defaults, header)
import Control.Lens ((&), (.~))
import Data.ByteString.Char8 (pack)
import Data.ByteString.Base64 (encode)

jiraOptions :: String -> Options
jiraOptions authString =
  defaults & header "Content-Type" .~ ["application/json"]
           & header "Authorization" .~ ["Basic " <>  (encode $ pack authString)]
