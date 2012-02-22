module Main where

import Control.Concurrent
import Control.Monad
import Network.Curl.Download
import System.Exit
import System.Process
import System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs
  foreverPing (args !! 0)

foreverPing :: String -> IO ()
foreverPing address = forever $ do
  ping address >>= notify address
  threadDelay (10*1000000)

ping :: String -> IO (Either String String)
ping = openURIString

notify :: String -> (Either String String) -> IO ()
notify address (Right _) = system (notifyCmd address) >> exitWith ExitSuccess
notify _       _         = return ()

notifyCmd addr = "growlnotify -s -m '"++addr++" is now online.' `date \"+%Y-%m-%d %H:%M:%S\"`"