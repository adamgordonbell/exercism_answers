module Gigasecond (fromDay) where

import Data.Time.Calendar(Day, addDays)

fromDay :: Day -> Day
fromDay day = addDays gigaday day

gigaday :: Integer
gigaday = foldr (flip div) gigaSecond divisors
 where
   divisors = [60,60,24]
   gigaSecond = 10^9