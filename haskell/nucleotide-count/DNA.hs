module DNA (count, nucleotideCounts)
where

import qualified Data.Map as Map
import Data.Maybe

type Count = Map.Map Char Int

count :: Char -> String -> Int
count c cs = fromMaybe (error ("invalid nucleotide " ++ show c)) (Map.lookup c (nucleotideCounts cs))

nucleotideCounts :: String -> Count
nucleotideCounts = foldr (accumulate 1) empty

empty :: Count
empty = foldr (accumulate 0) Map.empty "ACGT"

accumulate :: Int -> Char -> Count -> Count
accumulate i c = Map.insertWith (+) c i
