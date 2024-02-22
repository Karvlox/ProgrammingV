module HanoiTowers where

-- Función para resolver el problema de las Torres de Hanoi
-- Toma como entrada el número de discos y los nombres de los palos de origen, auxiliar y destino
hanoi :: Int -> String -> String -> String -> [(String, String)]
hanoi 0 _ _ _ = []  -- Si no hay discos, no hay movimientos
hanoi n source aux dest = -- Mover n discos desde el palo de origen a la pila de destino, utilizando la pila auxiliar
    hanoi (n-1) source dest aux ++   -- Mover n-1 discos de la pila de origen a la pila auxiliar, utilizando la pila de destino como auxiliar
    [(source, dest)] ++  -- Mover el disco restante de la pila de origen a la pila de destino
    hanoi (n-1) aux source dest  -- Mover los n-1 discos desde la pila auxiliar a la pila de destino, utilizando la pila de origen como auxiliar

-- Función para imprimir los movimientos realizados
-- Definición de la función printMoves que toma una lista de tuplas de String y realiza IO ()
printMoves :: [(String, String)] -> IO ()
printMoves [] = return () -- Si la lista de movimientos está vacía, no hay nada que imprimir, así que devolvemos la acción IO ()
printMoves ((source, dest):moves) -- Desestructuramos la lista de movimientos para obtener el primer movimiento y el resto de la lista
    | not (null source) && not (null dest) = do -- Verificamos si tanto el origen como el destino no son cadenas vacías
        putStrLn $ "Mover disco desde " ++ source ++ " hacia " ++ dest -- Si se cumple la condición, imprimimos el movimiento actual
        printMoves moves -- Llamamos recursivamente a printMoves con el resto de los movimientos
    -- Si no se cumple la condición anterior, es decir, si al menos uno de los extremos es una cadena vacía
    | otherwise = printMoves moves -- Llamamos recursivamente a printMoves con el resto de los movimientos


-- Función para resolver las Torres de Hanoi e imprimir los movimientos
solveHanoi :: Int -> String -> String -> String -> IO ()
solveHanoi n source aux dest = do -- Dada la cantidad de discos y los nombres de los palos, resolver las Torres de Hanoi y luego imprimir los movimientos
    let moves = hanoi n source aux dest  -- Calcular los movimientos necesarios para resolver las Torres de Hanoi
    printMoves moves  -- Imprimir los movimientos