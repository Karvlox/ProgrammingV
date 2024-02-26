import Data.Time.Clock.TAI (taiClock)

split:: String -> Char -> [String]
split [] _ = []
split (x:xs) c |x == c = split xs c
               |otherwise = [[x]] ++ split xs c


split2 :: String -> Char -> [String]
split2 [] _ = []
split2 (x:xs) c | x == c = split2 xs c
                | otherwise = (x : takeWhile (/= c) xs) : split2 (dropWhile (/= c) xs) c
