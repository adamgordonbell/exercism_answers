ageOn :: Planet -> Seconds -> Years
ageOn planet seconds = seconds / earthSeconds planet
  where
    earthSeconds :: Planet -> Seconds
    earthSeconds p = case p of
