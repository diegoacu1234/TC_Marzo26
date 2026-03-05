{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Eta reduce" #-}

module TadTabla (Table, TablaLista, create, upd, lkup, del) where

import Data.Map qualified as M

-- Interfaz
class Table t where
  create :: t a b
  upd :: (Eq a) => a -> b -> t a b -> t a b
  lkup :: (Eq a) => a -> t a b -> Maybe b
  del :: (Eq a) => a -> t a b -> t a b

-- Implementación concreta con listas
newtype TablaLista a b = TL [(a, b)]

instance Table TablaLista where -- Table es la interzz
  create = TL []

  upd k v (TL t) = TL ((k, v) : t)

  lkup _ (TL []) = Nothing
  lkup k (TL ((k1, v1) : xs))
    | k == k1 = Just v1
    | otherwise = lkup k (TL xs)

  del k (TL t) = TL (filter (\(k1, _) -> k1 /= k) t)

-- Se puede ajustar la especificación y usar el Data.Map