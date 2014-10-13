module SpaceAge (Planet(..), ageOn) where

data Planet = Earth
              | Mercury
              | Venus
              | Mars
              | Jupiter
              | Saturn
              | Uranus
              | Neptune

type Years = Float
type Seconds = Float

ageOn :: Planet -> Seconds -> Years
ageOn planet seconds = seconds / earthSeconds / earthYears planet
  where
    earthSeconds = 365.25 * 24 * 60 * 60
    earthYears p =  case p of
      Earth -> 1
      Mercury -> 0.2408467
      Venus -> 0.61519726
      Mars -> 1.8808158
      Jupiter -> 11.862615
      Saturn -> 29.447498
      Uranus -> 84.016846
      Neptune -> 164.79132
