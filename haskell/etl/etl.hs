module ETL(transform) where

import Data.Map.Strict(Map)
import qualified Data.Map.Strict as Map
import Data.Char

transform :: Map Int [String] -> Map String Int
transform = Map.foldlWithKey' accumulateNewKeys Map.empty

accumulateTransforms :: Map String Int -> Int -> [String] -> Map String Int
accumulateTransforms m i ss = Map.union m . Map.fromList $ pair i ss

pair :: Int -> [String] -> [(String,Int)]
pair i ss = zip (lower ss) (repeat i)
  where lower = fmap . fmap toLower
