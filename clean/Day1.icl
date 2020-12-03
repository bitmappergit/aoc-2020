module Day1

import StdEnv
import Text

target =: 2020

solveP1 :: *[Int] -> Int
solveP1 v = solver v v
  where solver [_ : xs] [] = solver xs v
        solver [x : xs] [y : ys]
          | x + y == target = x * y
          | otherwise = solver [x : xs] ys

solveP2 :: *[Int] -> Int
solveP2 v = solver v v v
  where solver [_ : xs] [] _ = solver xs v v
        solver xv [_ : ys] [] = solver xv ys v
        solver [x : xs] [y : ys] [z : zs]
          | x + y + z == target = x * y * z
          | otherwise = solver [x : xs] [y : ys] zs

read :: String *World -> (String, *World)
read name world
  # (ok, file, world) = fopen name FReadText world
  # (str, file) = freads file 16777216
  # (ok, world) = fclose file world
  = (str, world)

puts :: String *World -> *World
puts str world
  # (out, world) = stdio world
  # out = fwrites str out
  # (_, world) = fclose out world
  = world

print :: a *World -> *World | toString a
print x world = puts (toString x +++ "\n") world

Start :: *World -> *World
Start world
  # (str, world) = read "../day1.txt" world
  # lines = split "\n" str
  # nums = map toInt lines
  # resultP1 = solveP1 nums
  # resultP2 = solveP2 nums
  # world = print resultP1 world
  # world = print resultP2 world
  | otherwise = world
