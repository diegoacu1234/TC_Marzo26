module Practico0 where

-- GUIA PARA EXPANDIR UN LENGUAJE:

-- Solo incluyo lo necesario para poder calcular el largo/cardinal de un conjunto

-- Paso 1: Necesito un símbolo o notación nueva para poder expresar la operacion cardinal.

-- e1 ::= # e1

-- Con eso puedo escribir ahora: #{1}, #x, #({2} U {5}), etc...
-- En Haskell:
data Exp = Largo Exp deriving (Show)

-- Paso 2: ¿Qué retorna largo? Claramente un entero, pero yo no tengo enteros definidos en mis valores, por lo que debo extenderlos para que ahora admitan enteros también

-- En BNF los valores quedan:   v ::= Z

-- En Haskell:
data Val = C [Int] | I Int deriving (Show) -- necesito valor nuevo, antes no devolvia un entero

type Mem = [(String, Val)]

-- Paso 3: Regla de evaluación

{-
Aclaración: \Downarrow representa la flecha del juicio evaluación

	M , e \Downarrow  M' , c
---------------------------
	M , #e \Downarrow  M', length c
-}

eval :: Mem -> Exp -> (Mem, Val)
eval m (Largo e) =
  let (m', C l) = eval m e
   in (m', I (length l)) -- necesito la I para que compile