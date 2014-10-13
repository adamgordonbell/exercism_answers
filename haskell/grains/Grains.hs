module Grains (square, total) where

square :: Int -> Integer
square x = 2 ^ (x-1)

total :: Integer
total = 2 ^ 64 -1
