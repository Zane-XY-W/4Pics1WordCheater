{-# LANGUAGE DeriveDataTypeable #-}
module Main where
import           FourPicsOneWord
import           Data.Char
import           Prelude                         hiding (length)
import           System.Console.CmdArgs.Explicit
import           System.Console.CmdArgs.Implicit

data Args = Args{length :: Maybe String, letters :: Maybe String}
          deriving (Show, Data, Typeable)

argsP :: Args
argsP
  = Args{length =
           def &= name "n" &= typ "DIGIT" &= help "the length of the word (2-8)",
         letters =
           def &= name "l" &= typ "ALPHABET" &=
             help "the letters used to guess (a-z) case-insensitive"}
      &= summary "4pics1word Cheater v0.1, (C) Zane W"

argsD :: Mode (CmdArgs Args)
argsD = cmdArgsMode argsP

showHelp :: IO ()
showHelp
  = print (helpText [] HelpFormatDefault argsD)

printResults :: Args -> IO ()
printResults (Args (Just n) (Just l))
  = if (n `elem` map show [2 :: Int .. 8]) && all isAlpha l
      then print =<< filteredResults n (map toLower l)
      else showHelp
printResults _ = showHelp

main :: IO ()
main = printResults =<< cmdArgsRun argsD
