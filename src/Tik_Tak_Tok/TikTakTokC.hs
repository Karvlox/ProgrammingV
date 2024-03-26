module TikTaktokC where

import Data.List (transpose)
import Data.List (update)

-- Tipo de dato para representar el símbolo de cada jugador
data Player = X | O deriving (Eq, Show)

-- Tipo de dato para representar una celda del tablero
type Cell = Maybe Player

-- Tipo de dato para representar el tablero
type Board = [[Cell]]

-- Función para crear un tablero vacío
emptyBoard :: Board
emptyBoard = replicate 3 (replicate 3 Nothing)

-- Función para imprimir el tablero en la consola
printBoard :: Board -> IO ()
printBoard = putStrLn . unlines . map (concatMap showCell)
  where
    showCell :: Cell -> String
    showCell Nothing = " "
    showCell (Just X) = "X"
    showCell (Just O) = "O"

-- Función para realizar un movimiento en el tablero
move :: Board -> Int -> Int -> Player -> Maybe Board
move board row col player
  | row < 0 || row >= length board || col < 0 || col >= length (head board) = Nothing 
  | isEmptyCell (board !! row !! col) = Just $ updateBoard board row col player
  | otherwise = Nothing
  where
    isEmptyCell :: Cell -> Bool
    isEmptyCell cell = cell == Nothing
    
    updateBoard :: Board -> Int -> Int -> Player -> Board
    updateBoard b r c p = take r b ++ [take c (b !! r) ++ [Just p] ++ drop (c + 1) (b !! r)] ++ drop (r + 1) b

-- Función para verificar si hay un ganador
checkWinner :: Board -> Maybe Player
checkWinner board = checkLines (rows ++ cols ++ diags)
  where
    rows = board
    cols = transpose board
    diags = [[board !! 0 !! 0, board !! 1 !! 1, board !! 2 !! 2],
             [board !! 0 !! 2, board !! 1 !! 1, board !! 2 !! 0]]

    checkLines :: [[Cell]] -> Maybe Player
    checkLines [] = Nothing
    checkLines (x:xs)
      | all (== Just X) x = Just X
      | all (== Just O) x = Just O
      | otherwise = checkLines xs

-- Función para verificar si el tablero está lleno (empate)
isFull :: Board -> Bool
isFull = all (all isJust)
  where
    isJust :: Cell -> Bool
    isJust (Just _) = True
    isJust Nothing = False

-- Función para ejecutar el juego
playGame :: Player -> Board -> IO ()
playGame player board = do
  printBoard board
  case checkWinner board of
    Just p -> putStrLn $ "¡" ++ show p ++ " ha ganado!"
    Nothing ->
      if isFull board
        then putStrLn "¡Empate!"
        else do
          putStrLn $ "Turno de " ++ show player
          putStr "Fila: "
          row <- getLine
          putStr "Columna: "
          col <- getLine
          case move board (read row - 1) (read col - 1) player of
            Just newBoard -> playGame (nextPlayer player) newBoard
            Nothing -> putStrLn "Movimiento inválido. Inténtalo de nuevo."
  where
    nextPlayer :: Player -> Player
    nextPlayer X = O
    nextPlayer O = X

-- Función principal para iniciar el juego
main :: IO ()
main = playGame X emptyBoard
