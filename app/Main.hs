import HanoiTowers


main :: IO ()
main = do
    putStrLn "Caso de prueba 1:"
    solveHanoi 3 "A" "B" "C"

    putStrLn "\nCaso de prueba 2:"
    solveHanoi 1 "A" "B" "C"

    putStrLn "\nCaso de prueba 3:"
    solveHanoi 5 "A" "B" "C"

    putStrLn "\nCaso de prueba 4:"
    solveHanoi 0 "A" "B" "C"

    putStrLn "\nCaso de prueba 5:"
    solveHanoi 4 "A" "B" "C"

    putStrLn "\nCaso de prueba 6:"
    solveHanoi 2 "A" "B" "C"

    putStrLn "\nCaso de prueba 7:"
    solveHanoi 6 "A" "B" "C"

    putStrLn "\nCaso de prueba 8:"
    solveHanoi 7 "A" "B" "C"

    putStrLn "\nCaso de prueba 9:"
    solveHanoi 2 "A" "C" "B"

    putStrLn "\nCaso de prueba 10:"
    solveHanoi 5 "A" "C" "B"
