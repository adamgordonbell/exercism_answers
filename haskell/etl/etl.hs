module ETL(transform) where

import Data.Map.Strict(Map)
import qualified Data.Map.Strict as Map
import Data.Char

transform :: Map Int [String] -> Map String Int
transform = Map.foldlWithKey' go Map.empty

go :: Map String Int -> Int -> [String] -> Map String Int
go m i ss = Map.union m . Map.fromList $ pair i ss

pair :: Int -> [String] -> [(String,Int)]
pair i ss = zip lower (repeat i)
  where lower = fmap (fmap toLower) ss
