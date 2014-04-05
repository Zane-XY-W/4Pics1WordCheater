{-# LANGUAGE OverloadedStrings #-}
module FourPicsOneWord where
import           Control.Applicative
import qualified Data.Text            as T
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

extractDict :: String -> IO [T.Text]
extractDict url
  = do cont <- simpleHttp url
       let (wordsCursor:_) = fromDocument (parseLBS cont) $// element "pre" >=> child
           wordsText   = T.concat . content $ wordsCursor
       return $ concat $ T.words <$> T.lines wordsText

filteredResults :: String -> String -> IO [T.Text]
filteredResults n l = filter (T.all (`elem` l)) <$> extractDict (dictSource n)
