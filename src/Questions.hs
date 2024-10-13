module Questions (
    defaultResult, 
    findInstallments, 
    floorCeil,
    Stack(..),
    isEmpty,
    push,
    pop,
    peek,
    search
    ) where



-- DefautlResult é o valor usando na sáida quando não há solução.
defaultResult :: Int
defaultResult = (-10) ^ 9



-- QUESTÃO 1 #####################################################################################################################################################
-- ###############################################################################################################################################################

{-
    Dado um array ordenado e um número x, encontre um par (a,b) de números 
    pertencentes ao array tal que (a + b) se aproxime o máximo possível de x.
-}

findInstallments :: [Int] -> Int -> (Int, Int)
findInstallments [] _ = (defaultResult, defaultResult)
findInstallments numbers x = findInstallmentsAux1 numbers x defaultResult defaultResult

findInstallmentsAux1 :: [Int] -> Int -> Int -> Int -> (Int, Int)
findInstallmentsAux1 [] _ installmentA installmentB = (installmentA, installmentB)
findInstallmentsAux1 (a:as) x installmentA installmentB 
    | currentInstallmentB /= defaultResult && currentSum <= x && currentSum > actualSum = findInstallmentsAux1 as x a currentInstallmentB
    | otherwise = findInstallmentsAux1 as x installmentA installmentB 
    where
        currentInstallmentB = findInstallmentsAux2 as x a defaultResult
        currentSum = a + currentInstallmentB
        actualSum = installmentA + installmentB 

findInstallmentsAux2 :: [Int] -> Int -> Int -> Int -> Int
findInstallmentsAux2 [] _ _ installmentB = installmentB
findInstallmentsAux2 (b:bs) x installmentA installmentB
    | sumAux1 <= x && sumAux1 > sumAux2 = findInstallmentsAux2 bs x installmentA b
    | otherwise = findInstallmentsAux2 bs x installmentA installmentB
    where
        sumAux1 = installmentA + b
        sumAux2 = installmentA + installmentB



-- QUESTÃO 2 #####################################################################################################################################################
-- ###############################################################################################################################################################

{-
    Encontrar floor e ceil de um número x dentro de um array a. O número x pode não estar no array a. O floor(x) 
    é o número do array a que é menor que x e que mais se aproxima de x (pode existir mais de um número menor que x,
    o floor é o maior deles). Dualmente, o ceil(x)  é o número do array a que é maior que x e que mais se aproxima de
    x (pode existir mais de um número maior do que x, o ceil é o menor deles).
-}

floorCeil :: [Int] -> Int -> (Int, Int)
floorCeil [] _ = (defaultResult, defaultResult)
floorCeil array x = (floor, ceil)
    where
        orderedArray = mySort array
        floor = findFloor orderedArray x defaultResult
        ceil = findCeil orderedArray x defaultResult

-- Algoritmo de ordenação presente no material da disciplina de Programação Funcional.
mySort :: [Int] -> [Int]
mySort [] = []
mySort (x:xs) = mySort ys ++ [x] ++ mySort zs
    where
        ys = [a | a <- xs, a <= x]
        zs = [b | b <- xs, b > x]

findFloor :: [Int] -> Int -> Int -> Int
findFloor [] _ floor = floor
findFloor (y:ys) x floor
    | y < x = findFloor ys x y
    | otherwise = findFloor ys x floor

findCeil :: [Int] -> Int -> Int -> Int
findCeil [] _ ceil = ceil
findCeil (y:ys) x ceil
    | y > x = y
    | otherwise = findCeil ys x ceil



-- QUESTÃO 3 #####################################################################################################################################################
-- ###############################################################################################################################################################

{- 
    Implementar uma pilha e seus algoritmos em Haskell. Use a lista de Haskell como estrutura sobrejacente 
    e operações que não sejam acesso pelo índice.
-}

-- OBS.: Nesta implementação o topo da pilha é considerado como o primeiro elemento da lista sobrejacente.
data Stack t = Stack [t] deriving (Eq, Show)

{- 
    A função 'isEmpty' verifica se a pilha está vazia.
    Se a pilha estiver vazia o retorno é 'True', caso contrário o retorno é 'False'.
-}
isEmpty :: Stack t -> Bool
isEmpty (Stack []) = True
isEmpty _ = False

{- 
    A funcão 'push' adiciona um valor ao topo da pilha.
    O retorno é uma nova pilha com o valor adicionado.
-}
push :: Stack t -> t -> Stack t
push (Stack []) value = Stack [value]
push (Stack stack) value = Stack([value] ++ stack)

{- 
    A função 'pop' remove o topo da pilha.
    O retorno é uma tupla com a nova pilha e o valor removido.
    Caso a pilha seja vazia, o retorno é uma tupla com uma pilha vazia e o valor 'Nothing'.
-}
pop :: Stack t -> (Stack t, Maybe t)
pop (Stack []) = (Stack [], Nothing)
pop (Stack (x:xs)) = (Stack xs, Just x)
    
{-
    A funcão 'peek' retorna o valor do topo da pilha.    
    Se o elemento não estiver na pilha ou se a pilha estiver vazia, a função retorna 'Nothing'.
-}
peek :: Stack t -> Maybe t
peek (Stack []) = Nothing
peek (Stack (x:_)) = Just x

{-
    A função 'search' retorna a posição de um elemento na pilha, contando a partir do topo da pilha, com a contagem começando em 1.
    Se o elemento não estiver na pilha ou se a pilha estiver vazia, a função retorna -1.
-}
search :: (Eq t) => Stack t -> t -> Int
search (Stack []) _ = (-1)
search (Stack stack) value = searchAux (Stack stack) value 1

searchAux :: (Eq t) => Stack t -> t -> Int -> Int
searchAux (Stack []) _ _ = (-1)
searchAux (Stack (x:xs)) value position
    | x == value = position
    | otherwise = searchAux (Stack xs) value (position + 1)
