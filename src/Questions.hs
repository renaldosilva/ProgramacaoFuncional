module Questions (defaultResult, findInstallments, floorCeil) where


-- DefautlResult é o valor usando na sáida quando não há solução.
defaultResult :: Int
defaultResult = (-10) ^ 9


-- Questão 1: Dado um array ordenado e um número x, encontre um par (a,b) de números pertencentes ao array tal que (a + b) se aproxime o máximo possível de x.

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


-- Questão 2: Encontrar floor e ceil de um número x dentro de um array a. O número x pode não estar no array a. O floor(x) 
-- é o número do array a que é menor que x e que mais se aproxima de x (pode existir mais de um número menor que x,
-- o floor é o maior deles). Dualmente, o ceil(x)  é o número do array a que é maior que x e que mais se aproxima de
-- x (pode existir mais de um número maior do que x, o ceil é o menor deles).

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
