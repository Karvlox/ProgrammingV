-- Definición del Y-combinator
y :: (t -> t) -> t
y f = (\x -> f (x x)) (\x -> f (x x))

-- Función factorial usando el Y-combinator
factorial :: Integer -> Integer
factorial = y (\recur n -> if n == 0 then 1 else n * recur (n - 1))

-- Ejemplo de uso
main :: IO ()
main = do
    putStrLn "Factorial de 5:"
    print (factorial 5)
