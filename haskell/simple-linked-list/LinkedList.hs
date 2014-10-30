module LinkedList where

data LinkedList a = Nil |
                    LinkedList { datum ::  a, next :: LinkedList a }
                    deriving Show

nil :: LinkedList a
nil = Nil

isNil :: LinkedList a -> Bool
isNil Nil = True
isNil _ = False

toList :: LinkedList a -> [a]
toList Nil = []
toList (LinkedList a n) = a : toList n

fromList :: [a] -> LinkedList a
fromList = foldr LinkedList Nil

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList = fromList . reverse . toList

new :: a -> LinkedList a -> LinkedList a
new = LinkedList
