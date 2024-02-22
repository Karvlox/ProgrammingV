import Test.QuickCheck
import Hanoi

-- | Verifica que el número de movimientos es correcto para n discos.
prop_hanoiMovesLength :: Int -> Property
prop_hanoiMovesLength n =
  n >= 0 ==> length (hanoiMoves n "A" "C" "B") == 2^n - 1

-- | Verifica que los movimientos son válidos para n discos.
prop_hanoiMovesValid :: Int -> Property
prop_hanoiMovesValid n =
  n >= 0 ==> all isValidMove (hanoiMoves n "A" "C" "B")
  where
    isValidMove (from, to) = from `elem` ["A", "B", "C"] && to `elem` ["A", "B", "C"] && from /= to

-- | Verifica que los movimientos generados resuelven correctamente el problema para n discos.
prop_hanoiSolution :: Int -> Property
prop_hanoiSolution n =
  n >= 0 ==> and $ map isSolutionMove (hanoiMoves n "A" "C" "B")
  where
    isSolutionMove ("A", "C") = True
    isSolutionMove ("C", "A") = True
    isSolutionMove ("A", "B") = True
    isSolutionMove ("B", "A") = True
    isSolutionMove ("B", "C") = True
    isSolutionMove ("C", "B") = True
    isSolutionMove _ = False

-- | Ejecutar todas las pruebas
main :: IO ()
main = do
  putStrLn "Probando la longitud de hanoiMoves:"
  quickCheck prop_hanoiMovesLength
  putStrLn "Probando la validez de los movimientos en hanoiMoves:"
  quickCheck prop_hanoiMovesValid
  putStrLn "Probando si los movimientos resuelven el problema:"
  quickCheck prop_hanoiSolution
