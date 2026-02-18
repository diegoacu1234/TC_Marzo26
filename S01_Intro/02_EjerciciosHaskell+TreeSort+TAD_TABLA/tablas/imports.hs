module Imports where

import Tablas

t0 :: Tabla String Int
t0 = create -- []

t1 = upd "Hola" 1234 t0 -- [("Hola",1234)]

t2 = upd "Chau" 5678 t1 -- [("Chau",5678),("Hola",1234)]

t3 = upd "Hola" 9999 t2 -- [("Hola",9999),("Chau",5678),("Hola",1234)]

a = lkup "Hola" t1 -- Just 1234

b = lkup "Hola" t3 -- Just 9999

c = del "Chau" t3 -- [("Hola",9999),("Hola",1234)]
