import Control.AllSolutions
import List

solve2 l r = a + b =:= 2020 & r =:= a * b
  where a = anyOf l
        b = anyOf l

solve3 l r = a + b + c =:= 2020 & r =:= a * b * c
  where a = anyOf l
        b = anyOf l
        c = anyOf l

main = do
  text <- readFile "./day1.txt"
  let nums = map read $ lines text
  print . findfirst $ solve2 nums
  print . findfirst $ solve3 nums
