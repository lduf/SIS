# SIS
Programme Haskell pour faire des calculs sur les signaux


## Fonctionnalité :

- Calcul de l'autocorrélation d'un signal  
    ```autocorr [1,2,3,0,-3,-2,-1]```
 
- Calcul de la réponse d'un SLTI à partir de l'entrée ```x[n]``` et de la réponse impulsionnelle ```h[x]```  
    ```reponse (take 7 $ cycle [1]) [2,1,0,-1,-2,0,0]```
   
