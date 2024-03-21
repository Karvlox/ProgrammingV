module Exercises where

--Fold
--filter
--Either
--tuplas
--arbol binario
--expresion lambda
--patter machine


--expresion lambda

--Claro, en Haskell, las expresiones lambda son una forma de definir funciones de forma anónima y compacta. 
--Se utilizan principalmente cuando necesitas una función temporalmente o dentro de una expresión más grande.
-- La sintaxis básica de una expresión lambda es \argumentos -> cuerpo, donde \ es la barra invertida, argumentos 
--son los parámetros de la función, y cuerpo es la expresión que define el comportamiento de la función.


--Una función que suma dos números:

--(\x y -> x + y) 3 5
-- Output: 8

--(\x y z -> (x+y)*z) 

--Una función que devuelve el doble de un número:
--(\x -> x * 2) 4
-- Output: 8

--Una función que calcula el cuadrado de un número:
--(\x -> x * x) 3
-- Output: 9

--Una función que suma 1 a cada elemento de una lista:
--map (\x -> x + 1) [1, 2, 3, 4, 5]
-- Output: [2, 3, 4, 5, 6]

--Una función que devuelve True si un número es par y False si es impar:
--(\x -> if even x then True else False) 6
-- Output: True




--patter machine

--En Haskell, un patrón es una forma de descomponer un valor en partes más pequeñas para poder trabajar con él 
--de manera más específica. Haskell proporciona una sintaxis concisa y poderosa para hacer coincidir patrones,
--lo que se conoce como "pattern matching" (coincidencia de patrones). Los patrones se pueden usar en definiciones 
--de funciones, en expresiones case, en la declaración de tipos de datos, entre otros lugares.


--En una definición de función:
esCero :: Int -> Bool
esCero 0 = True
esCero _ = False
-- Si el argumento es 0, devuelve True, en caso contrario devuelve False



--En una expresión case:
diasSemana :: Int -> String
diasSemana n =
  case n of
    1 -> "Lunes"
    2 -> "Martes"
    3 -> "Miércoles"
    4 -> "Jueves"
    5 -> "Viernes"
    6 -> "Sábado"
    7 -> "Domingo"
    _ -> "Número de día inválido"
-- Devuelve el nombre del día de la semana correspondiente al número dado



--En la declaración de tipos de datos:
data Animal = Perro String | Gato Int | Pajaro
-- Animal puede ser un Perro con un nombre (String), un Gato con un peso (Int) o un Pajaro



--Desempaquetando tuplas:
area :: (Float, Float) -> Float
area (base, altura) = base * altura
-- Calcula el área de un rectángulo dado su base y altura


--Listas y Patrones:
sumaLista :: [Int] -> Int
sumaLista [] = 0
sumaLista (x:xs) = x + sumaLista xs
-- Suma todos los elementos de una lista de enteros



--Either

--En Haskell, Either es un tipo de datos algebraico que se utiliza para representar un valor que puede ser uno de 
--dos tipos posibles. La idea principal detrás de Either es poder manejar valores que pueden ser exitosos (Right) 
--o contener información sobre un error (Left). Esto es especialmente útil en situaciones donde una función 
--puede fallar y necesitas manejar ese error de manera explícita.


-- Función que divide dos números, devolviendo un error si el divisor es cero
dividir :: Float -> Float -> Either String Float
dividir _ 0 = Left "No se puede dividir por cero"
dividir numerador divisor = Right (numerador / divisor)

-- Función que toma el resultado de dividir y lo duplica
duplicar :: Float -> Float
duplicar x = x * 2

-- Función que realiza una división y luego duplica el resultado, manejando posibles errores
dividirYDuplicar :: Float -> Float -> Either String Float
dividirYDuplicar numerador divisor = case dividir numerador divisor of
  Left err -> Left err
  Right resultado -> Right (duplicar resultado)

-- Ejemplo de uso
ejemplo1 = dividirYDuplicar 10 2  -- Devuelve: Right 10.0
ejemplo2 = dividirYDuplicar 10 0  -- Devuelve: Left "No se puede dividir por cero"




--Fold

--En Haskell, fold es una función de orden superior que se utiliza para procesar una estructura de datos recursiva,
--como una lista, reduciéndola a un solo valor. Hay dos variantes principales de 
--fold: foldl (fold izquierdo) y foldr (fold derecho). La diferencia principal entre ellas radica en el 
--orden en que se procesan los elementos de la estructura de datos.


--foldl (fold izquierdo):

-- Definición de una función sumadora usando foldl
sumaLista :: [Int] -> Int
sumaLista lista = foldl (\acc x -> acc + x) 0 lista

-- Ejemplo de uso
ejemploFoldl = sumaLista [1, 2, 3, 4, 5]
-- Output: 15


--foldr (fold derecho):

-- Definición de una función sumadora usando foldr
sumaLista' :: [Int] -> Int
sumaLista' lista = foldr (\x acc -> acc + x) 0 lista

-- Ejemplo de uso
ejemploFoldr = sumaLista' [1, 2, 3, 4, 5]
-- Output: 15




--filter

--La función filter en Haskell se utiliza para filtrar elementos de una lista que cumplan con cierta condición. 
--Toma como argumentos una función de predicado (que devuelve True o False) y una lista, y devuelve una nueva 
--lista que contiene solo los elementos para los cuales la función de predicado devuelve True.


-- Definición de una función para filtrar números pares de una lista
filtrarPares :: [Int] -> [Int]
filtrarPares lista = filter (\x -> x `mod` 2 == 0) lista

-- Ejemplo de uso
ejemploFilter = filtrarPares [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- Output: [2, 4, 6, 8, 10]




--tuplas

--En Haskell, las tuplas son estructuras de datos que pueden contener un número fijo de elementos de diferentes tipos.
--Se crean usando paréntesis y separando los elementos con comas. Hay tuplas de dos elementos (pares) 
--y tuplas de tres elementos (triples), aunque Haskell permite tuplas de hasta 15 elementos.



--Tuplas de dos parámetros (par):

-- Ejemplo de una tupla que representa un punto en un plano cartesiano
punto :: (Float, Float)
punto = (3.0, 4.0)

-- Ejemplo de uso: Acceder a los componentes de la tupla
x :: Float
x = fst punto  -- Devuelve el primer elemento de la tupla (3.0)

y :: Float
y = snd punto  -- Devuelve el segundo elemento de la tupla (4.0)


--Tuplas de tres parámetros (triple):

-- Ejemplo de una tupla que representa un color en formato RGB
colorRGB :: (Int, Int, Int)
colorRGB = (255, 0, 0)  -- Rojo

-- Ejemplo de uso: Acceder a los componentes de la tupla
rojo :: Int
rojo = fst3 colorRGB  -- Devuelve el primer elemento de la tupla (255)

verde :: Int
verde = snd3 colorRGB  -- Devuelve el segundo elemento de la tupla (0)

azul :: Int
azul = trd3 colorRGB  -- Devuelve el tercer elemento de la tupla (0)

-- Funciones auxiliares para acceder a los elementos de una tupla de tres parámetros
fst3 :: (a, b, c) -> a
fst3 (x, _, _) = x

snd3 :: (a, b, c) -> b
snd3 (_, y, _) = y

trd3 :: (a, b, c) -> c
trd3 (_, _, z) = z



--arbol binario

--En Haskell, puedes definir un árbol binario utilizando recursión y tipos de datos algebraicos. 
--Un árbol binario consta de nodos que pueden tener dos hijos: uno izquierdo y uno derecho. Cada nodo puede contener un valor y opcionalmente puede ser un nodo hoja si no tiene hijos.


-- Definición del tipo de dato para un árbol binario
data ArbolBinario a = Nodo a (ArbolBinario a) (ArbolBinario a) | Hoja deriving Show

-- Función para insertar un elemento en un árbol binario
insertar :: Ord a => a -> ArbolBinario a -> ArbolBinario a
insertar x Hoja = Nodo x Hoja Hoja
insertar x (Nodo valor izquierda derecha)
  | x < valor = Nodo valor (insertar x izquierda) derecha
  | x > valor = Nodo valor izquierda (insertar x derecha)
  | otherwise = Nodo valor izquierda derecha  -- El elemento ya está en el árbol

-- Función para crear un árbol binario a partir de una lista de elementos
crearArbol :: Ord a => [a] -> ArbolBinario a
crearArbol = foldr insertar Hoja

-- Ejemplo de uso
arbolEjemplo :: ArbolBinario Int
arbolEjemplo = crearArbol [5, 3, 7, 2, 4, 6, 8]

-- Función para recorrer un árbol binario en orden (inorder traversal)
recorrerEnOrden :: ArbolBinario a -> [a]
recorrerEnOrden Hoja = []
recorrerEnOrden (Nodo valor izquierda derecha) = recorrerEnOrden izquierda ++ [valor] ++ recorrerEnOrden derecha

-- Ejemplo de recorrido en orden del árbol
ejemploRecorridoEnOrden = recorrerEnOrden arbolEjemplo
-- Output esperado: [2, 3, 4, 5, 6, 7, 8]
