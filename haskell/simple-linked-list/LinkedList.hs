module LinkedList where

import qualified Data.Foldable as Fold

data LinkedList a =
  Nil
  | LinkedList { datum ::  a, next :: LinkedList a }
    deriving (Show, Fold.Foldable)

nil :: LinkedList a
nil = Nil

isNil :: LinkedList a -> Bool
isNil Nil = True
isNil _ = False

toList :: LinkedList a -> [a]
toList = Fold.foldr (:) []

fromList :: [a] -> LinkedList a
fromList = Fold.foldr LinkedList Nil

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList = fromList . reverse . toList

new :: a -> LinkedList a -> LinkedList a
new = LinkedList
