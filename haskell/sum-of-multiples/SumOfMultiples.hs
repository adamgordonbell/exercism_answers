module SumOfMultiples (sumOfMultiples, sumOfMultiplesDefault) where

sumOfMultiplesDefault :: Int -> Int
sumOfMultiplesDefault = sumOfMultiples [3,5]

sumOfMultiples :: [Int] -> Int -> Int
sumOfMultiples divs limit = sum factors
  where
    factors = filter (`dividesAny` divs) [1.. pred limit]
    dividesAny x = any (divides x)
    divides x y = x `mod` y == 0
