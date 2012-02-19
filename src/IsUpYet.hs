module Main where

import Control.Concurrent
import Control.Monad
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

ping :: String -> IO ExitCode
ping address = system (pingCmd address)

notify :: String -> ExitCode -> IO ()
notify address ExitSuccess = system (notifyCmd address) >> exitWith ExitSuccess
notify _       _           = return ()

pingCmd addr = "ping -c3 "++addr++" &> /dev/null"
notifyCmd addr = "growlnotify -s -m '"++addr++" is now online.' `date \"+%Y-%m-%d %H:%M:%S\"`"