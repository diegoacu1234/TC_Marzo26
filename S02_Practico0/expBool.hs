-- pragma para que no llore si usamos tabs
{-# OPTIONS_GHC -fno-warn-tabs #-}

module ExpBool where

import Tablas -- tablas.hs tiene que estar en la misma carpeta que este archivo

------------
-- SINTAXIS--
------------
data Exp = Lit B | Disy Exp Exp | Conj Exp Exp | Neg Exp | Var Id | Asig Id Exp deriving (Show)

type B = Bool

type Id = String

-------------
-- SEMANTICA--
-------------

type Val = B

type Mem = Tabla Id Val

eval :: Mem -> Exp -> (Mem, Val)
eval m (Lit b) = (m, b)
-- Cada regla de las siguientes 3 se escribió de forma distinta para ver conceptos nuevos de Haskell:
eval m (Disy e1 e2) = case eval m e1 of
  (m', b1) -> case eval m' e2 of
    (m'', b2) -> (m'', b1 || b2) -- esta fue con case, como toda la vida
eval m (Conj e1 e2) =
  let (m', b1) = eval m e1 -- ver que "asigno" variables y luego las puedo usar
   in let (m'', b2) = eval m' e2
       in (m'', b1 && b2)
eval m (Neg e) = (m', not b)
  where
    (m', b) = eval m e -- parecido al let solo que aclaro al final
eval m (Var x) =
  let Just b = lkup x m
   in (m, b)
eval m (Asig x e) =
  let (m', v) = eval m e
   in (upd x v m', v)
