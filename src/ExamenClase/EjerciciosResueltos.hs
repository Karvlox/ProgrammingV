import Data.Char (isDigit)

split :: String -> Char -> [String]
split [] _ = []
split (x:xs) c
    | x == c = split xs c
    | otherwise = (x : takeWhile (/= c) xs) : split (dropWhile (/= c) xs) c

appendList :: String -> [String]
appendList x = split x ' '

calculateAverageAge :: [String] -> Double
calculateAverageAge [] = 0
calculateAverageAge xs = fromIntegral (sum (map read xs)) / fromIntegral (length xs)

returnNames :: [String] -> [String]
returnNames = map head . map appendList

main :: IO ()
main = do
    let students = "Ana 25, Jose 37, Maria 23, John 33"
    let studentList = appendList students
    putStrLn $ "List of Student Names: " ++ show (returnNames studentList)
    putStrLn $ "Average Age: " ++ show (calculateAverageAge (map (read . last . appendList) studentList))
