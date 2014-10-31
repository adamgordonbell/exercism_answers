module LinkedList  (datum, next, nil, isNil, fromList, toList, reverseLinkedList , new)where

import qualified Data.Foldable as Fold
import Data.Foldable (toList)

data LinkedList a =
  Nil
  | LinkedList { datum ::  a, next :: LinkedList a }
    deriving (Show, Fold.Foldable)

nil :: LinkedList a
nil = Nil

isNil :: LinkedList a -> Bool
isNil Nil = True
isNil _ = False

fromList :: [a] -> LinkedList a
fromList = Fold.foldr' LinkedList Nil

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList = Fold.foldl' (flip LinkedList) Nil

new :: a -> LinkedList a -> LinkedList a
new = LinkedList
