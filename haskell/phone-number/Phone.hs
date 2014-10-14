module Phone (areaCode, number, prettyPrint)
where

import Text.ParserCombinators.Parsec
import Control.Monad(void)
import Text.Printf

data Phone = Phone { area :: Int, num1 :: Int, num2 :: Int }
instance Show Phone where
  show (Phone a n1 n2) = printf "%03d%03d%04d" a n1 n2

areaCode :: String -> String
areaCode s = show . area $ readExpr s

number :: String -> String
number s = show $ readExpr s

prettyPrint :: String -> String
prettyPrint s = pretty $ readExpr s
  where
    pretty (Phone a n1 n2) = printf "(%03d) %03d-%04d" a n1 n2

nonNumber :: Parser ()
nonNumber = void $ many $ noneOf "1234567890"

parsePhone :: Parser Phone
parsePhone = do
    nonNumber
    a <- count 3 digit
    nonNumber
    n1 <- count 3 digit
    nonNumber
    n2 <- count 4 digit
    nonNumber
    eof
    return $ Phone (read a) (read n1) (read n2)

readExpr :: String -> Phone
readExpr input = case parse parse1 "" input of
    Left _ -> Phone 0 0 0
    Right val -> val
  where parse1 = try (char '1' >> parsePhone) <|> parsePhone
