module Anagram (anagramsFor) where

import Data.List
import Data.Char

anagramsFor :: String -> [String] -> [String]
anagramsFor a = filter isAnagram
  where
    isAnagram b1 = isMatch aKey (key b1)
    isMatch (k1, v1) (k2,v2) = k1 == k2 && v1 /= v2
    aKey = key a
    key x = let x' = map toLower x in (sort x', x')
