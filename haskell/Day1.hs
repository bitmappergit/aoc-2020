module Day1 where

solveP1 :: [Int] -> Int
solveP1 v = solve' v v
  where solve' (_ : as) [] = solve' as v
        solve' av@(a : _) (b : bs)
          | a + b == 2020 = a * b
          | otherwise = solve' av bs

solveP2 :: [Int] -> Int
solveP2 v = solve' v v v
  where solve' (_ : as) [] _ = solve' as v v
        solve' av (_ : bs) [] = solve' av bs v
        solve' av@(a : _) bv@(b : _) (c : cs)
          | a + b + c == 2020 = a * b * c
          | otherwise = solve' av bv cs

main :: IO ()
main = do
  inp <- lines <$> readFile "../day1.txt"
  let nums = map read inp
  print $ solveP1 nums
  print $ solveP2 nums


