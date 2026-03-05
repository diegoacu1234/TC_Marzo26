module Tablas (Tabla, lkup, upd, del, empty, getKeys) where

-- módulo abstrayendo la implementación: Vamos a usar el Data.Map para cambiar un poco

import Data.Map qualified as M

newtype Tabla a b = T (M.Map a b)

-- No quiero derivar el show, le voy a decir yo como quiero que muestre:
-- La precondición para poder mostrar la tabla es que pueda mostrar las claves y los valores
instance (Show a, Show b) => Show (Tabla a b) where
  show (T m) = "Resultado: " ++ show (M.toList m)

lkup :: (Ord a) => a -> Tabla a b -> Maybe b
lkup k (T m) =
  M.lookup k m

upd :: (Ord a) => a -> b -> Tabla a b -> Tabla a b
upd k v (T m) =
  T (M.insert k v m)

del :: (Ord a) => a -> Tabla a b -> Tabla a b
del k (T m) =
  T (M.delete k m)

empty :: Tabla a b
empty =
  T M.empty

getKeys :: Tabla a b -> [a]
getKeys (T m) =
  M.keys m