data DaysOfWeek = Monday|Tuesday|Friday

-- Como funciona el Y combinator Bool
-- Graham hutton
-- canal - cumputherPhilia
-- Atze Dijksta VHC

data Shape = Circle Float | Rect Float Float deriving Show --podemos definirle n tipos

--data Shape = Circle Float | Rect Float Float deriving Ord



-- Tipos de datos recursivos

--data Lis a = Nil | Cons a (List a)
data Mylis a = Null | Cons a (Mylis a) deriving Show
