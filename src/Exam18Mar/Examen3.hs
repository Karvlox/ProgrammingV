module Examen3 where

data Exprs = Val Char
            | Not Exprs
            | And Exprs Exprs
            | Or Exprs Exprs
            deriving(Show)


--Problem 1

-- Input 
-- (A∩B)∪(~A∩C)            

-- Output
-- Or(And(Val'A')(Val'B'))(And(Not(Val 'A'))(Val 'C'))

-- Opcion 1
-- esta mal estructurado.
--parser :: String -> Maybe Exprs
--parser str Exprs $ words str
--        where
--        parser' :: [String] -> Maybe Exprs
--       parser | (left:"∩":right) And left right
--               | (left:"∪":right) Or left right
--               | ("~":str) Not str
--               | otherwise Val str


--Opcion 2 
--se realizo en base a expressionEvaluator donde verificamos que encuentre el mismo signo y usar el Data Types
parseExpr :: String -> Exprs
parseExpr x
          | elem '∩' x = let (antes, _ :despues) = break (=='∩') x
                         in And (parseExpr antes) (parseExpr despues)
          | elem '∪' x = let (antes, _ :despues) = break (=='∪') x
                         in Or (parseExpr antes) (parseExpr despues)
          | elem '~' x = let (antes, _ :despues) = break (=='~') x
                         in Not (parseExpr despues)
          | otherwise  = Val (head x)


--Problem 2 Expression Evaluation

--Write a function to evaluate the logical expression given a set of variable assignments. Implement a function to evaluate the expression and return its truth value

--input 

--output