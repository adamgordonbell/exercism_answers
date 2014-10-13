module DNA (count, nucleotideCounts)
where

import qualified Control.Exception as E
import qualified Data.Map as Map

count :: Char -> String -> Int
count char cs = foldr go 0 cs
  where go c i
               | c == char = i+1
               | valid c = i
               | otherwise = error ("invalid nucleotide " ++ (show c))

nucleotideCounts :: String -> Map.Map Char Int
nucleotideCounts ns = Map.fromList [('A',count 'A' ns),('C', count 'C' ns),('G', count 'G' ns), ('T', count 'T' ns)]

valid :: Char -> Bool
valid 'A' = True
valid 'C' = True
valid 'G' = True
valid 'T' = True
valid  _  = False
