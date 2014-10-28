module DNA -- (count, nucleotideCounts)
where

import qualified Data.Map.Strict as SMap
import qualified Data.Map as Map
import Data.List

type SCount = SMap.Map Char Int
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

-----
----- Strict
-----
sCount :: Char -> String -> Int
sCount c cs = SMap.findWithDefault err c $ sNucleotideCounts cs
  where err = error $ "invalid nucleotide " ++ show c

sNucleotideCounts :: String -> SCount
sNucleotideCounts = foldl' (sAccumulate 1) sEmpty

sEmpty :: Count
sEmpty = foldl' (sAccumulate 0) SMap.empty "ACGT"

sAccumulate :: Int -> Count -> Char -> Count
sAccumulate i m c = Map.insertWith (+) c i m
