module Lib
    ( main
    ) where

import ExpressionEvaluator
import ArithmeticExpression



main :: IO ()
main = do
    let exprString = "2+3*5"
        parsedExpression = parseStringExpression exprString
        result = evalExpression parsedExpression
    putStrLn $ "Parsed Expression: " ++ show parsedExpression
    putStrLn $ "Result: " ++ show result
