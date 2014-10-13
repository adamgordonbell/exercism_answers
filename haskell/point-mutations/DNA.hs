module DNA (hammingDistance) where

import Data.Composition

hammingDistance :: Eq a => [a] -> [a] -> Int
hammingDistance = sum .: zipWith (fromEnum .: (/=))
