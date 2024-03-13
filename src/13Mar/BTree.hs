module BTree where

data Tree a = Leaf
            | Node Integer (Tree a) a (Tree a)
            deriving (Show, Eq)

height :: Tree a -> Integer
height Leaf = 0
height (Node h _ _ _) = h

insert :: a -> Tree a -> Tree a
insert x Leaf = Node 1 Leaf x Leaf
insert x (Node h left val right)
    | height left <= height right = let newLeft = insert x left
                                    in Node (1 + max (height newLeft) (height right)) newLeft val right
    | otherwise = let newRight = insert x right
                  in Node (1 + max (height left) (height newRight)) left val newRight

foldTree :: [a] -> Tree a
foldTree = foldr insert Leaf


main :: IO ()
main = do
    let values = "ABCDEFGHIJ"
        tree = foldTree values
    putStrLn "Balanced Binary Tree:"
    print tree
