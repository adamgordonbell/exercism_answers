module DNA (count, nucleotideCounts)
where

import qualified Data.Map.Strict as Map
import Data.List

type Count = Map.Map Char Int

count :: Char -> String -> Int
count c cs = Map.findWithDefault err c $ nucleotideCounts cs
  where err = error $ "invalid nucleotide " ++ show c

nucleotideCounts :: String -> Count
nucleotideCounts = foldl' (accumulate 1) empty

empty :: Count
empty = foldl' (accumulate 0) Map.empty "ACGT"

accumulate :: Int -> Count -> Char -> Count
accumulate i m c = Map.insertWith (+) c i m
