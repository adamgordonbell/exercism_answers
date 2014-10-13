module Strain (keep, discard) where

keep, discard :: ( a -> Bool) -> [a] -> [a]
keep f = foldr (prependIf f) []
discard f = foldr (prependIf (not . f)) []

prependIf :: (a -> Bool) -> a -> [a] -> [a]
prependIf f a as
  | f a = a:as
  | otherwise = as
