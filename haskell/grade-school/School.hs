module School (School, sorted, empty, add, grade)
where

import Control.Arrow (second)
import Control.Applicative ((<$>))
import qualified Data.Map.Strict as Map
import Data.Map.Strict(Map)
import qualified Data.Set as Set
import Data.Set(Set)

type School = Map Int (Set String)

sorted :: School -> [(Int, [String])]
sorted s = second Set.toAscList <$> Map.toList s

empty :: School
empty = Map.fromList []

add :: Int -> String -> School -> School
add gr name = Map.insertWith Set.union gr (Set.singleton name)

grade :: Int -> School -> [String]
grade gr school = Set.toAscList $ Map.findWithDefault Set.empty gr school
