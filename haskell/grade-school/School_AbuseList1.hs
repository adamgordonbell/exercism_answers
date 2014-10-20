{-- OverLoadedLists --}
module School where

-- import Data.List (foldl')
import Control.Arrow
import Control.Applicative
import qualified Data.Map as Map
import Data.Map(Map)
import qualified Data.Set as Set
import Data.Set(Set)
import GHC.Exts

type School = Map Int (Set String)

instance IsList School where
  type Item School = (Int,Set String)
  fromList = Map.fromList
  toList = Map.toList

instance IsList (Set String) where
  type Item (Set String) = String
  fromList = Set.fromList
  toList = Set.toList

sorted :: School -> [(Int, [String])]
sorted s = second Set.toList <$> Map.toList s

empty :: School
empty = []

add :: Int -> String -> School -> School
add gr name = Map.insertWith Set.union gr [name]

grade :: Int -> School -> [String]
grade gr school = Set.toList $ Map.findWithDefault [] gr school
