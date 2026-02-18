{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Eta reduce" #-}
module Tablas (Tabla, create, upd, lkup, del) where

type Tabla a b = [(a, b)]

create :: Tabla a b
create = []

-- upd :: Eq a => a -> b -> Tabla a b -> Tabla a b
-- upd k v [] = [(k,v)]
-- upd k v ((k1,v1):kvs)
--  | k == k1 = ((k1,v):kvs)
--  | otherwise = (k1,v1):(upd k v kvs)

upd :: (Eq a) => a -> b -> Tabla a b -> Tabla a b
upd k v t = (k, v) : t

lkup :: (Eq a) => a -> Tabla a b -> Maybe b
lkup k [] = Nothing
lkup k ((k1, v1) : kvs)
  | k == k1 = Just v1
  | otherwise = lkup k kvs

-- del :: Eq a => a -> Tabla a b -> Tabla a b
-- del k [] = []
-- del k ((k1,v1):kvs)
--  | k == k1 = kvs
--  | otherwise = (k1,v1): (del k kvs )

del :: (Eq a) => a -> Tabla a b -> Tabla a b
del k t = filter (\(k1, v1) -> k1 /= k) t
