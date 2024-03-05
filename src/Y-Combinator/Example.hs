
yCombinator :: (a -> a) -> a
yCombinator f = f (yCombinator f)


orOperation :: Bool -> Bool -> Bool
orOperation = yCombinator (\f x y -> if x then True else (if y then True else False))


main :: IO ()
main = do
  let result1 = orOperation True True
      result2 = orOperation True False
      result3 = orOperation False True
      result4 = orOperation False False
  putStrLn $ "True OR True = " ++ show result1
  putStrLn $ "True OR False = " ++ show result2
  putStrLn $ "False OR True = " ++ show result3
  putStrLn $ "False OR False = " ++ show result4
