module WordCount (wordCount) where

import Data.Map.Strict(Map, fromListWith)
import Data.Char
import Data.List.Split

wordCount :: String -> Map String Int
wordCount = fromListWith (+) . fmap tuple . splitWord

splitWord :: String -> [String]
splitWord = wordsBy (not . isAlphaNum)

tuple :: String -> (String,Int)
tuple x = (fmap toLower x,1)
