type Signal = [Int]

-- Appeller la fonction d'autocorrélation comme ça : autocorr [1,2,3,0,-1,-2]
autocorr :: Signal -> Signal 
autocorr x = 
 let
  x1 = (bourrageT x (length x -1))
  x2 = (bourrageQ x (length x-1))
 in take (length x1) (autocorr' x1 x2 ) 

autocorr' :: Signal -> Signal -> Signal
autocorr' x1 x2 = (sumSig x1 x2 : autocorr' x1 (decalage x2))
-- Pour utiliser ce programme on appelle la fonction reponse avec en premier argument x et en second argument h. Marche si x et h font la meme taille
-- ex : reponse (take 7 $ cycle [1]) [2,1,0,-1,-2,0,0]
-- (ex d'un exo de TD)
reponse :: Signal -> Signal -> Signal
reponse x h = take (2*length x') (reponse'  x' (bourrageT h (length x -1))) where x' = reverse' x

reponse' :: Signal -> Signal -> Signal
reponse' [] _ = []
reponse' x h = sumSig x h :reponse' (decalage x) h

reverse' :: Signal -> Signal
reverse' [] = [] 
reverse' x = bourrageQ (reverse x) (length x - 1) 

bourrageT :: Signal -> Int -> Signal
bourrageT s n = (take n $ cycle [0])++s

bourrageQ :: Signal -> Int -> Signal
bourrageQ s n = s++(take n $ cycle [0])

decalage :: Signal -> Signal
decalage s = 0:init s

sumSig :: Signal -> Signal -> Int
sumSig [] [] = 0
sumSig (xs:x) (ys:y) = (xs*ys) + sumSig x y
