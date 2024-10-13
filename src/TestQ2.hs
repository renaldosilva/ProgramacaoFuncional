module TestQ2 (runTestsQ2) where

import Questions (defaultResult, floorCeil)
import Util (getTestStatus, printResultQ2)


-- ###################### Testes Questão 2 ######################

testModelQ2 :: [Int] -> Int -> (Int, Int) -> [Char] -> IO()
testModelQ2 list x expectedResult testName = do
    let result = floorCeil list x
    let testStatus = getTestStatus expectedResult result
    printResultQ2 testName list x expectedResult result testStatus

testFloorCeilForPositiveValueInRange :: IO()
testFloorCeilForPositiveValueInRange = do
    let testName = "\x1b[36mTest floor/ceil for positive value in range\x1b[0m"
    testModelQ2 [5, 8, 12, 23, 25] 22 (12, 23) testName

testFloorCeilForPositiveValueWithinTheLeftLimitOfTheRange :: IO()
testFloorCeilForPositiveValueWithinTheLeftLimitOfTheRange = do
    let testName = "\x1b[36mTest floor/ceil for positive value within the left limit of the range\x1b[0m"
    testModelQ2 [5, 13, 25, 33, 47] 5 (defaultResult, 13) testName

testFloorCeilForPositiveValueWithinTheRightLimitOfTheRange :: IO()
testFloorCeilForPositiveValueWithinTheRightLimitOfTheRange = do
    let testName = "\x1b[36mTest floor/ceil for positive value within the right limit of the range\x1b[0m"
    testModelQ2 [17, 45, 67, 98, 99] 99 (98, defaultResult) testName

testFloorCeilForPositiveValueOutsideTheLeftRange :: IO()
testFloorCeilForPositiveValueOutsideTheLeftRange = do
    let testName = "\x1b[36mTest floor/ceil for positive value outside the left range\x1b[0m"
    testModelQ2 [34, 58, 77, 78, 112] 31 (defaultResult, 34) testName

testFloorCeilForPositiveValueOutsideTheRightRange :: IO()
testFloorCeilForPositiveValueOutsideTheRightRange = do
    let testName = "\x1b[36mTest floor/ceil for positive value outside the right range\x1b[0m"
    testModelQ2 [3, 4, 34, 44, 58] 59 (58, defaultResult) testName

testFloorCeilForPositiveValueForUnsortedList :: IO()
testFloorCeilForPositiveValueForUnsortedList = do
    let testName = "\x1b[36mTest floor/ceil for positive value for unsorted list\x1b[0m"
    testModelQ2 [47, 13, 5, 23, 12] 24 (23, 47) testName

testFloorCeilForNegativeValueInRange :: IO()
testFloorCeilForNegativeValueInRange = do
    let testName = "\x1b[36mTest floor/ceil for negative value in range\x1b[0m"
    testModelQ2 [-25, -23, -12, -8, -5, 2, 20] (-20) (-23, -12) testName

testFloorCeilForNegativeValueWithinTheLeftLimitOfTheRange :: IO()
testFloorCeilForNegativeValueWithinTheLeftLimitOfTheRange = do
    let testName = "\x1b[36mTest floor/ceil for negative value within the left limit of the range\x1b[0m"
    testModelQ2 [-47, -33, -25, -13, 5] (-47) (defaultResult, -33) testName

testFloorCeilForNegativeValueWithinTheRightLimitOfTheRange :: IO()
testFloorCeilForNegativeValueWithinTheRightLimitOfTheRange = do
    let testName = "\x1b[36mTest floor/ceil for negative value within the right limit of the range\x1b[0m"
    testModelQ2 [-333, -252, -127, -112, -99] (-99) (-112, defaultResult) testName

testFloorCeilForNegativeValueOutsideTheLeftRange :: IO()
testFloorCeilForNegativeValueOutsideTheLeftRange = do
    let testName = "\x1b[36mTest floor/ceil for negative value outside the left range\x1b[0m"
    testModelQ2 [-25, -23, -12] (-27) (defaultResult, -25) testName

testFloorCeilForNegativeValueOutsideTheRightRange :: IO()
testFloorCeilForNegativeValueOutsideTheRightRange = do
    let testName = "\x1b[36mTest floor/ceil for negative value outside the right range\x1b[0m"
    testModelQ2 [-292, -137, -122, -93] (-92) (-93, defaultResult) testName

testFloorCeilForNegativeValueForUnsortedList :: IO()
testFloorCeilForNegativeValueForUnsortedList = do
    let testName = "\x1b[36mTest floor/ceil for negative value for unsorted list\x1b[0m"
    testModelQ2 [-47, -13, -5, -23, -12] (-19) (-23, -13) testName

testFloorCeilWithEmptyList :: IO()
testFloorCeilWithEmptyList = do
    let testName = "\x1b[36mTest floor/ceil with empty list\x1b[0m"
    testModelQ2 [] 19 (defaultResult, defaultResult) testName

runTestsQ2 :: IO()
runTestsQ2 = do
    testFloorCeilForPositiveValueInRange
    testFloorCeilForPositiveValueWithinTheLeftLimitOfTheRange
    testFloorCeilForPositiveValueWithinTheRightLimitOfTheRange
    testFloorCeilForPositiveValueOutsideTheLeftRange
    testFloorCeilForPositiveValueOutsideTheRightRange
    testFloorCeilForPositiveValueForUnsortedList
    testFloorCeilForNegativeValueInRange
    testFloorCeilForNegativeValueWithinTheLeftLimitOfTheRange
    testFloorCeilForNegativeValueWithinTheRightLimitOfTheRange
    testFloorCeilForNegativeValueOutsideTheLeftRange
    testFloorCeilForNegativeValueOutsideTheRightRange
    testFloorCeilForNegativeValueForUnsortedList
    testFloorCeilWithEmptyList

-- ##############################################################

main :: IO()
main = do
    putStrLn "###################### Testes Questão 2 ######################"
    putStrLn ""
    runTestsQ2
    putStrLn "##############################################################"
