module Phone (areaCode, number, prettyPrint)
where

import Text.ParserCombinators.Parsec
import Text.Printf
import Data.Char

data Phone = Phone { area :: String, num1 :: String, num2 :: String }

areaCode :: String -> String
areaCode s = area $ readExpr s

number :: String -> String
number s = normalPrint $ readExpr s

prettyPrint :: String -> String
prettyPrint s = pretty $ readExpr s
  where
    pretty (Phone a n1 n2) = printf "(%s) %s-%s" a n1 n2

normalPrint :: Phone -> String
normalPrint (Phone a n1 n2) = a ++ n1 ++ n2

readExpr :: String -> Phone
readExpr input = either (const $ Phone "000" "000" "0000") id (parse parse1 "" input)
  where
    parse1 = try (nonNumber >> char '1' >> parsePhone) <|> parsePhone
    parsePhone = do
      nonNumber
      a <- count 3 digit
      nonNumber
      n1 <- count 3 digit
      nonNumber
      n2 <- count 4 digit
      nonNumber
      eof
      return $ Phone a n1 n2
    nonNumber = skipMany $ satisfy (not . isDigit)
