module Hanoi where

-- | Mueve los discos de una torre de origen a una torre destino utilizando una torre auxiliar como temporal.
hanoi :: Int -> String -> String -> String -> IO ()
hanoi n origin destiny aux
  | n == 1 = putStrLn ("Mover disco de " ++ origin ++ " a " ++ destiny)
  | otherwise = do
      hanoi (n - 1) origin aux destiny
      putStrLn ("Mover disco de " ++ origin ++ " a " ++ destiny)
      hanoi (n - 1) aux destiny origin

-- | Función para calcular los movimientos de la solución de las Torres de Hanoi para n discos
hanoiMoves :: Int -> String -> String -> String -> [(String, String)]
hanoiMoves 0 origin destiny aux = []
hanoiMoves n origin destiny aux =
  hanoiMoves (n - 1) origin aux destiny
    ++ [(origin, destiny)]
    ++ hanoiMoves (n - 1) aux destiny origin

-- | Función principal que inicia el juego de las Torres de Hanoi.
main :: IO ()
main = do
  putStrLn "Torres de Hanoi con 3 discos:"
  hanoi 3 "A" "C" "B"
  putStrLn ("Número de movimientos: " ++ show (length (hanoiMoves 3 "A" "C" "B")))