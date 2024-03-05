

type Name = String
type Age = Int

data Person = Student Name | Worker Name Age deriving(Eq, Show)

zero_ :: Maybe Int 
zero_  = Just 0

app :: (a -> b) -> Maybe a -> Maybe b
app f Nothing = Nothing
app f (Just x) = Just (f x)

(|x -> x + 1)
