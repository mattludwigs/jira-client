{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}

module Jira.Types.Project where

import Data.Text (Text)
import GHC.Generics
import Data.Aeson (FromJSON, ToJSON)

data Project = Project
  { expand :: !Text
  , self :: !Text
  , id :: !Text
  , key :: !Text
  , name :: !Text
  , projectTypeKey :: !Text
  } deriving (Show, Generic)


instance FromJSON Project
instance ToJSON Project
