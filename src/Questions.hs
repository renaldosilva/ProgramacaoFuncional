module Questions (defaultResult, findInstallments) where


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
