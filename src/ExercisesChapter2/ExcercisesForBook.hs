module ExcercisesForBook where

--1. Work through the examples from this chapter using GHCi.

-- agregue screenshots de los ejercicios en consola

--Aplicacion de funciones.

double x = x + x

quadruple x = double (double x)

--------------------------------
--Mi primer script

factorial n = product [1..n]

average ns = sum ns `div` length ns 


-- La regla de diseño

a = b + c
    where 
        b = 1 
        c = 2 
        d = a * 2 

-- a = ab
ab = b + c
    where 
        {b = 1;
        c = 2};
d = ab * 2

--a = ac and d = da
ac = b + c where {b = 1; c = 2}; da = ac * 2


--2. Parenthesise the following numeric expressions:


v = ((2^3)*4)

x = (2^3) * 4

m = 2+(3*4^5)

--3.  The script below contains three syntactic errors. Correct these errors and then check that your script works properly using GHCi.

n = a `div` length xs
    where
        a = 10
        xs = [1,2,3,4,5]


last1 :: [a] -> a
last1 xs = head (reverse xs)

last2 :: [a] -> a
last2 [x] = x
last2 (_:xs) = last2 xs


init1 :: [a] -> [a]
init1 xs = reverse (tail (reverse xs))

init2 :: [a] -> [a]
init2 [_] = []
init2 (x:xs) = x : init2 xs


