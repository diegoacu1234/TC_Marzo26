{-# OPTIONS_GHC -fno-warn-tabs #-}
module Repaso where

-- λ − notation y case
not1 :: Bool -> Bool
not1 = \b -> case b of {
				True -> False;
				False -> True
			}
			
not2 :: Bool -> Bool
not2 b = case b of {
				True -> False;
				False -> True
		}

-- Pattern-Matching y guardas	
not3 :: Bool -> Bool
not3 True = False
not3 False = True


(&&&) :: Bool -> Bool -> Bool
(&&&) True y = y
(&&&) False _ = False -- o bien: (&&&) _ _ = False

(>>>) :: Bool -> Bool -> Bool
(>>>) True False = False
(>>>) _ _ = True

sumi :: Integer -> Integer
sumi 0 = 0
sumi x = x + (sumi $ x-1)

evenn :: Integer -> Bool
evenn 0 = True
evenn 1 = False
evenn x = evenn (x-2)


lengthh :: [a] -> Integer
lengthh [] = 0
lengthh (x:xs) = 1 + (lengthh xs)

mapp :: (a->b) -> [a] -> [b]
mapp f [] = []
mapp f (x:xs) = (f x):(mapp f xs)

filterr :: (a->Bool) -> [a] -> [a]
filterr f [] = []
filterr f (x:xs)
	| f x = x:(filterr f xs)
	| otherwise = filterr f xs
	
andd :: [Bool] -> Bool
andd [] = True
andd (True:xs) = andd xs
andd (False:xs) = False

anddd :: [Bool] -> Bool
anddd [] = True
anddd (x:xs)
	| x = anddd xs
	| otherwise = False
	
	
data AB a = H a | N (AB a) a (AB a) deriving Show

altura :: AB a -> Integer
altura (H a) = 1
altura (N i x d) = 1+ (max (altura i) (altura d))

existeEnArbol :: Eq a => AB a -> a -> Bool
existeEnArbol (H x) a = x==a
existeEnArbol (N i x d) a
	| x==a = True
	| otherwise = (existeEnArbol i a) && (existeEnArbol d a)
	
mapAB :: AB a -> (a->b) -> AB b
mapAB (H a) f = H (f a)
mapAB (N i x d) f = N (mapAB i f) (f x) (mapAB d f)

t1 = N (H 3) 5 (N (H 9) 0 (H 2))
res = mapAB t1 (> 3)