module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear y
  | divides 400 = True
  | divides 100 = False
  | otherwise = divides 4
 where
   divides x = y `mod` x == 0
