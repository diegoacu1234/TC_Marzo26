data N = O | S N

unos :: [N]
unos = S O : unos

len :: [a] -> N
len [] = O
len (_ : xs) = S (len xs)

f :: Bool
f = case len unos of
  O -> True
  S x -> False