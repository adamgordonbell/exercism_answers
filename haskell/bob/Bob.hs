module Bob where

import Data.Char

-- No alpha in the string - Fine
-- ? at the end - Sure
-- Yelling == All caps
-- Whatever if all else fails
responseFor :: String -> String
responseFor s
    | isGibberish s = "Fine. Be that way!"
    | isShouting s = "Woah, chill out!"
    | isQuestion s = "Sure."
    | otherwise = "Whatever."

isQuestion :: String -> Bool
isQuestion s = not ( null s) && last s == '?'

isGibberish :: String -> Bool
isGibberish s = not( isQuestion s) && not( any isAlphaNum s)

isShouting :: String -> Bool
isShouting s = (\as -> and [and $ map isUpper as, not $ null as]) $ filter isAlpha s
