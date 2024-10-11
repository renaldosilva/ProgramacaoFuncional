module TestQ1 (runTestsQ1) where
    
import Questions (defaultResult, findInstallments)


-- ###################### Testes Questão 1 ######################

printResultQ1 :: [Int] -> Int -> (Int, Int) -> (Int, Int) -> IO()
printResultQ1 array x expectedResult result = do
    putStrLn $ "Input: arr[] = " ++ show array ++ ", x = " ++ show x
    putStrLn $ "Expected result: " ++ show expectedResult
    putStrLn $ "Result: " ++ show result
    putStrLn ""

testModelQ1 :: [Int] -> Int -> (Int, Int) -> IO()
testModelQ1 array x expectedResult = do
    let result = findInstallments array x
    printResultQ1 array x expectedResult result

testPositiveValueOutsideTheRightRange :: IO()
testPositiveValueOutsideTheRightRange = do
    testModelQ1 [10, 22, 28, 29, 30, 40] 54 (22, 30)

testPositiveValueOutsideTheRightRange2 :: IO()
testPositiveValueOutsideTheRightRange2 = do
    testModelQ1 [1, 3, 4, 7, 10] 15 (4, 10)

testPositiveValueOutsideTheLeftRange :: IO()
testPositiveValueOutsideTheLeftRange = do
    testModelQ1 [10, 15, 19] 9 (defaultResult, defaultResult)

testPositiveValueWithinLeftRange :: IO()
testPositiveValueWithinLeftRange = do
    testModelQ1 [11, 21, 22, 33, 35, 64] 32 (11, 21)

testPositiveValueWithinRightRange :: IO()
testPositiveValueWithinRightRange = do
    testModelQ1 [2, 19, 31, 37, 62] 99 (37, 62)

testWithEmptyArray :: IO()
testWithEmptyArray = do
    testModelQ1 [] 5 (defaultResult, defaultResult)

testNegativeValueOutsideTheRightRange :: IO()
testNegativeValueOutsideTheRightRange = do
    testModelQ1 [-60, -33, -22, -18] (-10) (-22, -18)

testNegativeValueOutsideTheLeftRange :: IO()
testNegativeValueOutsideTheLeftRange = do
    testModelQ1 [-6, -3, -2] (-10) (defaultResult, defaultResult)

testNegativeValueWithinLeftRange :: IO()
testNegativeValueWithinLeftRange = do
    testModelQ1 [-6, -3, -2] (-9) (-6, -3)

testNegativeValueWithinRightRange :: IO()
testNegativeValueWithinRightRange = do
    testModelQ1 [-34, -21, -13, -7] (-20) (-13, -7)

runTestsQ1 :: IO()
runTestsQ1 = do
    testPositiveValueOutsideTheRightRange
    testPositiveValueOutsideTheRightRange2
    testPositiveValueOutsideTheLeftRange
    testPositiveValueWithinRightRange
    testPositiveValueWithinLeftRange
    testWithEmptyArray
    testNegativeValueOutsideTheRightRange
    testNegativeValueOutsideTheLeftRange
    testNegativeValueWithinRightRange
    testNegativeValueWithinLeftRange

-- ##############################################################

main :: IO()
main = do
    putStrLn "###################### Testes Questão 1 ######################"
    putStrLn ""
    runTestsQ1
    putStrLn "##############################################################"
