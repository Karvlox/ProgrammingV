module Exercises_CarlosBallester where

import Data.Char (isDigit)


split :: String -> Char -> [String]
split [] _ = []
split (x:xs) c
    | x == c = split xs c
    | otherwise = (x : takeWhile (/= c) xs) : split (dropWhile (/= c) xs) c


appendList :: String -> [String]
appendList x = split x ' '


calculateAverageAge :: [String] -> Int
calculateAverageAge [] = 0 
calculateAverageAge xs = sum (map read xs) `div` length xs


returnNames :: [String] -> [String]
returnNames = takeWhile (not . any isDigit)

