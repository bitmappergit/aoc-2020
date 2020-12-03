import Control.AllSolutions
import List

invf :: (a -> b) -> (b -> a)
invf f y | f x =:<= y = x where x free

solve2 l | a + b =:= 2020 = a * b
  where a = anyOf l
        b = anyOf l  
{-
solve3 l r = a + b + c =:= 2020 & r =:= a * b * c
  where a = anyOf l
        b = anyOf l
        c = anyOf l
main = do
  text <- readFile "./day1.txt"
  let nums = map read $ lines text
  doSolve $ solve2 nums a
  doSolve $ solve3 nums b
  print a
  print b
    where a, b free
-}
