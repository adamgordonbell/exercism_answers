module School where

import Control.Arrow
import Control.Applicative
import qualified Data.Map as Map
import Data.Map(Map)
import qualified Data.Set as Set
import Data.Set(Set)

type School = Map Int (Set String)

sorted :: School -> [(Int, [String])]
sorted s = second Set.toList <$> Map.toList s

empty :: School
empty = Map.fromList []

add :: Int -> String -> School -> School
add gr name = Map.insertWith Set.union gr (Set.fromList [name])

grade :: Int -> School -> [String]
grade gr school = Set.toList $ Map.findWithDefault Set.empty gr school
