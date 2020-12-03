{-# LANGUAGE LambdaCase, BlockArguments #-}
module Day3 where

import Text.Parsec
import Text.Parsec.String

data Piece = T | E | O | X
  deriving (Show, Eq)

type Board = [[Piece]]

linear l (x : xs) (y : ys)
  | y < length l = ((l !! y) !! x) : linear l xs ys
  | otherwise = []
linear _ [] [] = []

occurences :: Eq a => a -> [a] -> Int
occurences _ [] = 0
occurences a (x : xs)
  | x == a = succ $ occurences a xs
  | otherwise = occurences a xs

parser :: Parser Board
parser = manyTill parseLine eof
  where parseLine :: Parser [Piece]
        parseLine = do
          c <- manyTill (char '#' <|> char '.') endOfLine
          pure $ map (\case '#' -> T ; '.' -> E) c

solve board = zipWith (linear new) first second
  where new = map cycle board
        first = [[0..], [0,3..], [0,5..], [0,7..], [0,1..]]
        second = [[0..], [0..], [0..], [0..], [0,2..]]

main :: IO ()
main = do
  Right temp <- parseFromFile parser "../day3.txt"
  let res = map (occurences T) $ solve temp
  print (res !! 1)
  print $ product res
