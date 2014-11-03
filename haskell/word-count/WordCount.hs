module WordCount (wordCount) where

import Data.Map.Strict(Map, fromListWith)
import Data.Char

wordCount :: String -> Map String Int
wordCount = fromListWith (+) . fmap tuple . splitWord

splitWord :: String -> [String]
splitWord = words . fmap toLower . replaceWhen f ' '
  where f x = not (isAlphaNum x) && not (isSpace x)

replaceWhen :: (a -> Bool) -> a -> [a] -> [a]
replaceWhen f d = foldr go []
  where go y ys
          | f y = d:ys
          | otherwise = y:ys

tuple :: a -> (a,Int)
tuple x = (x,1)
