{-# LANGUAGE OverloadedStrings #-}
module FourPicsOneWord where
import           Control.Applicative
import           Data.List
import qualified Data.Text            as T
import           Network              (withSocketsDo)
import           Network.HTTP.Conduit (simpleHttp)
import           Text.HTML.DOM        (parseLBS)
import           Text.XML.Cursor

dictSource :: String -> String
dictSource n
  = "http://www.poslarchive.com/math/scrabble/lists/common-"
    ++ case n of
           (h : _) | h `elem` "5678" -> [h]
           _ -> "234"
    ++ ".html"

extractDict :: String -> IO [String]
extractDict url = do cont <- withSocketsDo $ simpleHttp url
                     let (wordsCursor : _) = fromDocument (parseLBS cont) $// element "pre" >=> child
                         wordsText = T.concat . content $ wordsCursor
                     return $ T.unpack <$> (T.lines >=> T.words) wordsText

filteredResults :: String -> String -> IO [String]
filteredResults n l = filter (null . (\\ l)) <$> extractDict (dictSource n)
