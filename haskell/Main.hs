module Main where

import qualified Day1
import qualified Day2
import qualified Day3

main :: IO ()
main = do
  putStrLn "day1: "
  Day1.main
  putStrLn "day2: "
  Day2.main
  putStrLn "day3: "
  Day3.main
