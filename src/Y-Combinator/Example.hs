import Data.List

import Data.List

-- Definición del Y-combinator
y :: (t -> t) -> t
y f = (\x -> f (x x)) (\x -> f (x x))

-- Función para operador AND
andFunc :: [Bool] -> Bool
andFunc = y (\f -> \case
                    []     -> True
                    (x:xs) -> x && f xs)


main :: IO ()
main = do
    let boolList1 = [True, True, True]
        boolList2 = [True, False, True]
    putStrLn $ "El resultado de AND para la lista " ++ show boolList1 ++ " es: " ++ show (andFunc boolList1)
    putStrLn $ "El resultado de AND para la lista " ++ show boolList2 ++ " es: " ++ show (andFunc boolList2)


-- El resultado de AND para la lista [True, True, True] es: True
-- El resultado de AND para la lista [True, False, True] es: False
