{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.Monoid ((<>))
import Network.Wreq (getWith, responseBody)
import Control.Lens
import Data.Aeson
import Jira (jiraOptions)
import Jira.Types.Project (Project)
import System.Environment (getEnv)

main :: IO ()
main = do
  authString <- getEnv "AUTH_STRING"
  jiraUrl <- getEnv "JIRA_URL"

  r <- getWith (jiraOptions authString) (jiraUrl <> "/rest/api/2/project")
  case (eitherDecode (r ^. responseBody) :: Either String [Project]) of
    Left _ -> print "No"
    Right p ->
      mapM_ (putStrLn . show) p
