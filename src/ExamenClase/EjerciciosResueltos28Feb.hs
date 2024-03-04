module Main where

split :: String -> Char -> [String]
split [] _ = []
split (x:xs) c
  | x == c = split xs c
  | otherwise = (x : takeWhile (/= c) xs) : split (dropWhile (/= c) xs) c

calculateAverage :: [Int] -> Double
calculateAverage xs = fromIntegral (sumElements xs) / fromIntegral (length xs)

sumElements :: [Int] -> Int
sumElements [] = 0
sumElements (x:xs) = x + sumElements xs

getNames :: String -> [String]
getNames input = split input ','

getAges :: [String] -> [String]
getAges [] = []
getAges (x:xs) = secondElement (words x) : getAges xs


filterAgeLessThan  :: [(String, Int)] -> Int -> [(String, Int)]
filterAgeLessThan  [] _ = []
filterAgeLessThan  ((name, age):xs) limit
    | age < limit = (name, age) : filterAgeLessThan xs limit
    | otherwise = filterAgeLessThan xs limit


filterAgeRange :: [(String, Int)] -> Int -> Int -> [(String, Int)]
filterAgeRange [] _ _ = []
filterAgeRange ((name, age):xs) x y
    | age >= x && age <= y = (name, age) : filterAgeRange xs x y
    | otherwise = filterAgeRange xs x y

getStudentsInRange :: [String] -> [String] -> Int -> Int -> [(String, Int)]
getStudentsInRange names ages x y =
    let studentAges = zip names (map convertToInt ages)
    in filterAgeRange studentAges x y


convertToInt :: String -> Int
convertToInt str = read str :: Int

secondElement :: [String] -> String
secondElement [] = ""
secondElement (_:x:_) = x
secondElement _ = ""
