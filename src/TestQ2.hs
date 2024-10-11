module TestQ2 (runTestsQ2) where

import Questions (defaultResult, floorCeil)


-- ###################### Testes Questão 2 ######################

printResultQ2 :: [Int] -> Int -> (Int, Int) -> (Int, Int) -> IO()
printResultQ2 array x expectedResult result = do 
    putStrLn $ "Input: arr[] = " ++ show array ++ ", x = " ++ show x
    putStrLn $ "Expected result: floor = " ++ show (fst expectedResult) ++ ", ceil = " ++ show (snd expectedResult)
    putStrLn $ "Result: floor = " ++ show (fst result) ++ ", ceil = " ++ show (snd result)
    putStrLn ""

testModelQ2 :: [Int] -> Int -> (Int, Int) -> IO()
testModelQ2 array x expectedResult = do
    let result = floorCeil array x
    printResultQ2 array x expectedResult result

testFloorCeilForPositiveValueInRange :: IO()
testFloorCeilForPositiveValueInRange = do
    testModelQ2 [5, 8, 12, 23, 25] 22 (12, 23)

testFloorCeilForPositiveValueWithinTheLeftLimitOfTheRange :: IO()
testFloorCeilForPositiveValueWithinTheLeftLimitOfTheRange = do
    testModelQ2 [5, 13, 25, 33, 47] 5 (defaultResult, 13)

testFloorCeilForPositiveValueWithinTheRightLimitOfTheRange :: IO()
testFloorCeilForPositiveValueWithinTheRightLimitOfTheRange = do
    testModelQ2 [17, 45, 67, 98, 99] 99 (98, defaultResult)

testFloorCeilForPositiveValueOutsideTheLeftRange :: IO()
testFloorCeilForPositiveValueOutsideTheLeftRange = do
    testModelQ2 [34, 58, 77, 78, 112] 31 (defaultResult, 34)

testFloorCeilForPositiveValueOutsideTheRightRange :: IO()
testFloorCeilForPositiveValueOutsideTheRightRange = do
    testModelQ2 [3, 4, 34, 44, 58] 59 (58, defaultResult)

testFloorCeilForPositiveValueForUnsortedArray :: IO()
testFloorCeilForPositiveValueForUnsortedArray = do
    testModelQ2 [47, 13, 5, 23, 12] 24 (23, 47)

testFloorCeilForNegativeValueInRange :: IO()
testFloorCeilForNegativeValueInRange = do
    testModelQ2 [-25, -23, -12, -8, -5, 2, 20] (-20) (-23, -12)

testFloorCeilForNegativeValueWithinTheLeftLimitOfTheRange :: IO()
testFloorCeilForNegativeValueWithinTheLeftLimitOfTheRange = do
    testModelQ2 [-47, -33, -25, -13, 5] (-47) (defaultResult, -33)

testFloorCeilForNegativeValueWithinTheRightLimitOfTheRange :: IO()
testFloorCeilForNegativeValueWithinTheRightLimitOfTheRange = do
    testModelQ2 [-333, -252, -127, -112, -99] (-99) (-112, defaultResult)

testFloorCeilForNegativeValueOutsideTheLeftRange :: IO()
testFloorCeilForNegativeValueOutsideTheLeftRange = do
    testModelQ2 [-25, -23, -12] (-27) (defaultResult, -25)

testFloorCeilForNegativeValueOutsideTheRightRange :: IO()
testFloorCeilForNegativeValueOutsideTheRightRange = do
    testModelQ2 [-292, -137, -122, -93] (-92) (-93, defaultResult)

testFloorCeilForNegativeValueForUnsortedArray :: IO()
testFloorCeilForNegativeValueForUnsortedArray = do
    testModelQ2 [-47, -13, -5, -23, -12] (-19) (-23, -13)

testFloorCeilWithEmptyArray :: IO()
testFloorCeilWithEmptyArray = do
    testModelQ2 [] 19 (defaultResult, defaultResult)

runTestsQ2 :: IO()
runTestsQ2 = do
    testFloorCeilForPositiveValueInRange
    testFloorCeilForPositiveValueWithinTheLeftLimitOfTheRange
    testFloorCeilForPositiveValueWithinTheRightLimitOfTheRange
    testFloorCeilForPositiveValueOutsideTheLeftRange
    testFloorCeilForPositiveValueOutsideTheRightRange
    testFloorCeilForPositiveValueForUnsortedArray
    testFloorCeilForNegativeValueInRange
    testFloorCeilForNegativeValueWithinTheLeftLimitOfTheRange
    testFloorCeilForNegativeValueWithinTheRightLimitOfTheRange
    testFloorCeilForNegativeValueOutsideTheLeftRange
    testFloorCeilForNegativeValueOutsideTheRightRange
    testFloorCeilForNegativeValueForUnsortedArray
    testFloorCeilWithEmptyArray

-- ##############################################################

main :: IO()
main = do
    putStrLn "###################### Testes Questão 2 ######################"
    putStrLn ""
    runTestsQ2
    putStrLn "##############################################################"
