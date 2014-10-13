{-# LANGUAGE LambdaCase #-}
module DNA ( toRNA) where

toRNA :: String -> String
toRNA = fmap $ \case
   'G' -> 'C'
   'C' -> 'G'
   'T' -> 'A'
   'A' -> 'U'
   a -> error ("only GCTA chars are valid.  got " ++ show a)
