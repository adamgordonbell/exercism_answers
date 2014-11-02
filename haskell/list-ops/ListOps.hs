module ListOps
  ( length
  , reverse
  , map
  , filter
  , foldr
  , foldl'
  , (++)
  , concat
  ) where

import Prelude hiding
  ( length, reverse, map, filter, foldr, (++), concat )

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' _ z [] = z
foldl' f z (x:xs) = z' `seq` foldl' f z' xs
  where z' = f z x

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr _ b [] = b
foldr f z (x:xs) = f x z'
  where z' = foldr f z xs

length :: [a] -> Int
length = foldl' (flip (const succ)) 0

reverse :: [a] -> [a]
reverse = foldl' (flip (:)) []

map :: (a -> b) -> [a] -> [b]
map f = foldr go []
  where go a bs = f a : bs

filter :: (a -> Bool) -> [a] -> [a]
filter f = foldr (go f) []
    where
      go f1 y ys
        | f1 y = y : ys
        | otherwise = ys

(++) :: [a] -> [a] -> [a]
[] ++ ys = ys
(x:xs) ++ ys = x : (xs ++ ys)

concat :: [[a]] -> [a]
concat = foldr (++) []
