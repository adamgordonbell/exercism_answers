module School (School, sorted, empty, add, grade)
where

import Control.Arrow (second)
import Control.Applicative ((<$>))
import qualified Data.Map.Strict as Map
import Data.Map.Strict(Map)
import Data.List

type School = Map Int [String]

sorted :: School -> [(Int, [String])]
sorted s = second sort <$> Map.toList s

empty :: School
empty = Map.empty

add :: Int -> String -> School -> School
add gr name = Map.insertWith (++) gr [name] 

grade :: Int -> School -> [String]
grade gr school = sort $ Map.findWithDefault [] gr school
