module Day2 where

import Text.Parsec
import Text.Parsec.String

type Pass = ((Int, Int), Char, String)

rangeParse :: Parser (Int, Int)
rangeParse = do
  a <- manyTill digit $ char '-'
  b <- many1 digit
  pure (read a, read b)

parser :: Parser Pass
parser = do
  range <- rangeParse <* spaces
  chr <- anyChar <* char ':' <* spaces
  pass <- many1 letter
  discard newline <|> eof
  pure (range, chr, pass)
    where discard x = x >> pure ()

occurences :: Eq a => a -> [a] -> Int
occurences _ [] = 0
occurences a (x : xs)
  | x == a = succ $ occurences a xs
  | otherwise = occurences a xs

solve1 :: [Pass] -> Int
solve1 [] = 0
solve1 (((a, b), c, pass) : xs)
  | occurences c pass `elem` [a..b] = succ $ solve1 xs
  | otherwise = solve1 xs

solve2 :: [Pass] -> Int
solve2 [] = 0
solve2 (((a, b), c, pass) : xs)
  | (pass !! pred a == c) /= (pass !! pred b == c) = succ $ solve2 xs
  | otherwise = solve2 xs
  
main :: IO ()
main = do
  Right temp <- parseFromFile (manyTill parser eof) "../day2.txt"
  print $ solve1 temp 
  print $ solve2 temp
