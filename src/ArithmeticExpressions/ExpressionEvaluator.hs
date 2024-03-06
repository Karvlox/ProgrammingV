module ExpressionEvaluator(evalExpression, parseStringExpression) where

import ArithmeticExpression

evalExpression :: Expression -> Int
evalExpression (Val n) = n
evalExpression (Sum x y) = (evalExpression x) + (evalExpression y)
evalExpression (Mult x y ) = (evalExpression x) * (evalExpression y)


parseStringExpression :: String -> Expression
parseStringExpression s = parseExpression (filter (/=' ') s)

parseExpression :: String -> Expression
parseExpression s
  | '+' `elem` s = let (lhs, _:rhs) = break (=='+') s
                   in Sum (parseExpression lhs) (parseExpression rhs)
  | '*' `elem` s = let (lhs, _:rhs) = break (=='*') s
                   in Mult (parseExpression lhs) (parseExpression rhs)
  | '^' `elem` s = let (lhs, _:rhs) = break (=='^') s
                   in Pow (parseExpression lhs) (parseExpression rhs)
  | '/' `elem` s = let (lhs, _:rhs) = break (=='/') s
                   in Div (parseExpression lhs) (parseExpression rhs)
  | otherwise    = Val (read s :: Int)


