{-# LANGUAGE BangPatterns #-}
import Control.Exception
import Data.List

main = do
    evaluate (f [1..10] (0 :: Int, 0 :: Int))

f []     c = c
f (x:xs) c = f xs (tick x c)

tick x (c0, c1) | even x    = (c0, c1 + 1)
                | otherwise = (c0 + 1, c1)

f1 []     c = c
f1 (x:xs) c = f1 xs (tick1 x c)

tick1 x (!c0, !c1) | even x    = (c0, c1 + 1)
                | otherwise = (c0 + 1, c1)

reorderings :: [Int] -> [[Int]]
reorderings xs = take len $ map (take len) . tails . cycle $ xs
  where len = length xs
