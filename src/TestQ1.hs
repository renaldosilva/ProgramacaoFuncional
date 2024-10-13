module TestQ1 (runTestsQ1) where
    
import Questions (defaultResult, findInstallments)
import Util (getTestStatus, printResultQ1)


-- ###################### Testes Questão 1 ######################

testModelQ1 :: [Int] -> Int -> (Int, Int) -> [Char] -> IO()
testModelQ1 list x expectedResult testName = do
    let result = findInstallments list x
    let testStatus = getTestStatus expectedResult result
    printResultQ1 testName list x expectedResult result testStatus

testPositiveValueOutsideTheRightRange1 :: IO()
testPositiveValueOutsideTheRightRange1 = do
    let testName = "\x1b[36mTest positive value outside the right range 1\x1b[0m"
    testModelQ1 [10, 22, 28, 29, 30, 40] 54 (22, 30) testName

testPositiveValueOutsideTheRightRange2 :: IO()
testPositiveValueOutsideTheRightRange2 = do
    let testName = "\x1b[36mTest positive value outside the right range 2\x1b[0m"
    testModelQ1 [1, 3, 4, 7, 10] 15 (4, 10) testName

testPositiveValueOutsideTheLeftRange :: IO()
testPositiveValueOutsideTheLeftRange = do
    let testName = "\x1b[36mTest positive value outside the left range\x1b[0m"
    testModelQ1 [10, 15, 19] 9 (defaultResult, defaultResult) testName

testPositiveValueWithinLeftRange :: IO()
testPositiveValueWithinLeftRange = do
    let testName = "\x1b[36mTest positive value within left range\x1b[0m"
    testModelQ1 [11, 21, 22, 33, 35, 64] 32 (11, 21) testName

testPositiveValueWithinRightRange :: IO()
testPositiveValueWithinRightRange = do
    let testName = "\x1b[36mTest positive value within right range\x1b[0m"
    testModelQ1 [2, 19, 31, 37, 62] 99 (37, 62) testName
 
testWithEmptyList :: IO()
testWithEmptyList = do
    let testName = "\x1b[36mTest with empty list\x1b[0m"
    testModelQ1 [] 5 (defaultResult, defaultResult) testName

testNegativeValueOutsideTheRightRange :: IO()
testNegativeValueOutsideTheRightRange = do
    let testName = "\x1b[36mTest negative value outside the right range\x1b[0m"
    testModelQ1 [-60, -33, -22, -18] (-10) (-22, -18) testName

testNegativeValueOutsideTheLeftRange :: IO()
testNegativeValueOutsideTheLeftRange = do
    let testName = "\x1b[36mTest negative value outside the left range\x1b[0m"
    testModelQ1 [-6, -3, -2] (-10) (defaultResult, defaultResult) testName

testNegativeValueWithinLeftRange :: IO()
testNegativeValueWithinLeftRange = do
    let testName = "\x1b[36mTest negative value within right range\x1b[0m"
    testModelQ1 [-6, -3, -2] (-9) (-6, -3) testName

testNegativeValueWithinRightRange :: IO()
testNegativeValueWithinRightRange = do
    let testName = "\x1b[36mTest negative value within left range\x1b[0m"
    testModelQ1 [-34, -21, -13, -7] (-20) (-13, -7) testName

runTestsQ1 :: IO()
runTestsQ1 = do
    testPositiveValueOutsideTheRightRange1
    testPositiveValueOutsideTheRightRange2
    testPositiveValueOutsideTheLeftRange
    testPositiveValueWithinRightRange
    testPositiveValueWithinLeftRange
    testWithEmptyList
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
