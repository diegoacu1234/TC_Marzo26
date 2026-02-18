module TreeSort where

data AB a = H | N (AB a) a (AB a)

sort :: (Ord a) => [a] -> [a]
sort = inOrder . cargarArbol -- El . es el operador composicion - Es como el fog de Cálculo para escribir f(g(...))

-- En clase, entre todos vamos a programar estas funciones.

cargarArbol :: (Ord a) => [a] -> AB a
cargarArbol = undefined

inOrder :: AB a -> [a]
inOrder = undefined