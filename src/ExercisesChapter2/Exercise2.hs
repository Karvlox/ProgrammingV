module Exercise2 where

import Data.Char    

isOperand :: Char -> Bool
isOperand c | c == '+' || c == '/' || c == '-' || c == '/' || c == '*'  = True
            | otherwise = False

priority :: Char -> Int
priority c  | c == '*' || c == '/' = 7
            | c == '+' || c == '-' = 6
            | c == '^' = 8
            | otherwise = 0           

tupleFromExpression :: String -> (String, Char, (String, Char, String))
tupleFromExpression "_" = ()
tupleFromExpression xs | isDigit xs = (xs,"",())
                       | ((takeWhile isDigit xs), 
                         (head (dropWhile isDigit xs)),
                         tupleFromExpression(tail (dropWhile (isDigit xs))))

