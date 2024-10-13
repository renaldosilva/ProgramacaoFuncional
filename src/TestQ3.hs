module TestQ3 (runTestsQ3) where

import Questions (
    Stack(..),
    isEmpty,
    push,
    pop,
    peek,
    search
    )


-- ###################### Testes Questão 3 ######################

-- Pilha = [] | top = Nothing
emptyStack :: Stack t
emptyStack = Stack []

-- Pilha = [3] | top = 3
stackOfOneElement :: Stack Int
stackOfOneElement = stack 
    where
        new = emptyStack
        stack = push new 3

-- Pilha = [31, 11, 2, 25, 0] | top = 0
stackOfMultipleElements :: Stack Int
stackOfMultipleElements = stack
    where 
        new = emptyStack
        stack = push (push (push (push (push new 31) 11) 2) 25) 0

printResultQ3V1 :: [Char] -> Stack Int -> Bool -> Bool -> IO()
printResultQ3V1 testName stack expectedResult result = do
    putStrLn testName
    print stack
    putStrLn $ "Expected result: " ++ show expectedResult
    putStrLn $ "Result: " ++ show result
    putStrLn ""

printResultQ3V2 :: [Char] -> Stack Int -> Int -> Stack Int -> Stack Int -> IO()
printResultQ3V2 testName stack value expectedResult result = do
    putStrLn testName
    print stack
    putStrLn $ "Value: " ++ show value
    putStrLn $ "Expected result: " ++ show expectedResult
    putStrLn $ "Result: " ++ show result
    putStrLn ""

printResultQ3V3 :: [Char] -> Stack Int -> (Stack Int, Maybe Int) -> (Stack Int, Maybe Int) -> IO()
printResultQ3V3 testName stack expectedResult result = do
    putStrLn testName
    print stack
    putStrLn $ "Expected result: " ++ show expectedResult
    putStrLn $ "Result: " ++ show result
    putStrLn ""

printResultQ3V4 :: [Char] -> Stack Int -> Maybe Int -> Maybe Int -> IO()
printResultQ3V4 testName stack expectedResult result = do
    putStrLn testName
    print stack
    putStrLn $ "Expected result: " ++ show expectedResult
    putStrLn $ "Result: " ++ show result
    putStrLn ""

printResultQ3V5 :: [Char] -> Stack Int -> Int -> Maybe Int -> Maybe Int -> IO()
printResultQ3V5 testName stack value expectedResult result = do
    putStrLn testName
    print stack
    putStrLn $ "Value: " ++ show value
    putStrLn $ "Expected result: " ++ show expectedResult
    putStrLn $ "Result: " ++ show result
    putStrLn ""

testIsEmptyName :: [Char]
testIsEmptyName = "\x1b[36mTest 'isEmpty'\x1b[0m"

testIsEmptyOnEmptyStack :: IO()
testIsEmptyOnEmptyStack = do
    let stack = emptyStack
    let result = isEmpty stack
    printResultQ3V1 testIsEmptyName stack True result

testIsEmptyWithPopulatedStack :: IO()
testIsEmptyWithPopulatedStack = do
    let stack = stackOfMultipleElements
    let result = isEmpty stack
    printResultQ3V1 testIsEmptyName stack False result

testPushName :: [Char]
testPushName = "\x1b[36mTest 'push'\x1b[0m"

testPushOnEmptyStack :: IO()
testPushOnEmptyStack = do
    let stack = emptyStack
    let value = 3
    let newStack = push stack value
    let expectedStack = Stack [value]
    printResultQ3V2 testPushName stack value expectedStack newStack

testPushWithPopulatedStack :: IO()
testPushWithPopulatedStack = do
    let stack = stackOfMultipleElements
    let value = 7
    let newStack = push stack value
    let expectedStack = Stack [31, 11, 2, 25, 0, value]
    printResultQ3V2 testPushName stack value expectedStack newStack

testPopName :: [Char]
testPopName = "\x1b[36mTest 'pop'\x1b[0m"

testPopOnEmptyStack :: IO()
testPopOnEmptyStack = do
    let stack = emptyStack
    let result = pop stack
    let expectedResult = (Stack [], Nothing)
    printResultQ3V3 testPopName stack expectedResult result

testPopWithPopulatedStack1 :: IO()
testPopWithPopulatedStack1 = do
    let stack = stackOfOneElement
    let result = pop stack
    let expectedResult = (Stack [], Just 3)
    printResultQ3V3 testPopName stack expectedResult result

testPopWithPopulatedStack2 :: IO()
testPopWithPopulatedStack2 = do
    let stack = stackOfMultipleElements
    let result = pop stack
    let expectedResult = (Stack [31, 11, 2, 25], Just 0)
    printResultQ3V3 testPopName stack expectedResult result

testPeekName :: [Char]
testPeekName = "\x1b[36mTest 'peek'\x1b[0m"

testPeekOnEmptyStack :: IO()
testPeekOnEmptyStack = do
    let stack = emptyStack
    let result = peek stack
    let expectedResult = Nothing
    printResultQ3V4 testPeekName stack expectedResult result

testPeekWithPopulatedStack :: IO()
testPeekWithPopulatedStack = do
    let stack = stackOfMultipleElements
    let result = peek stack
    let expectedResult = Just 0
    printResultQ3V4 testPeekName stack expectedResult result

testSearchName :: [Char]
testSearchName = "\x1b[36mTest 'search'\x1b[0m"

testSearchOnEmptyStack :: IO()
testSearchOnEmptyStack = do
    let stack = emptyStack
    let value = 4
    let result = Just (search stack value)
    let expectedResult = Just (-1)
    printResultQ3V5 testSearchName stack value expectedResult result

testSearchWithPopulatedStack1 :: IO()
testSearchWithPopulatedStack1 = do
    let stack = stackOfMultipleElements
    let value = 0
    let result = Just (search stack value)
    let expectedResult = Just 1
    printResultQ3V5 testSearchName stack value expectedResult result

testSearchWithPopulatedStack2 :: IO()
testSearchWithPopulatedStack2 = do
    let stack = stackOfMultipleElements
    let value = 25
    let result = Just (search stack value)
    let expectedResult = Just 2
    printResultQ3V5 testSearchName stack value expectedResult result

testSearchWithPopulatedStack3 :: IO()
testSearchWithPopulatedStack3 = do
    let stack = stackOfMultipleElements
    let value = 11
    let result = Just (search stack value)
    let expectedResult = Just 4
    printResultQ3V5 testSearchName stack value expectedResult result

testSearchWithPopulatedStack4 :: IO()
testSearchWithPopulatedStack4 = do
    let stack = stackOfMultipleElements
    let value = 19
    let result = Just (search stack value)
    let expectedResult = Just (-1)
    printResultQ3V5 testSearchName stack value expectedResult result

runTestsQ3 :: IO()
runTestsQ3 = do
    testIsEmptyOnEmptyStack
    testIsEmptyWithPopulatedStack
    testPushOnEmptyStack
    testPushWithPopulatedStack
    testPopOnEmptyStack 
    testPopWithPopulatedStack1
    testPopWithPopulatedStack2
    testPeekOnEmptyStack 
    testPeekWithPopulatedStack
    testSearchOnEmptyStack
    testSearchWithPopulatedStack1
    testSearchWithPopulatedStack2
    testSearchWithPopulatedStack3
    testSearchWithPopulatedStack4

main :: IO()
main = do
    putStrLn "###################### Testes Questão 3 ######################"
    putStrLn ""
    runTestsQ3
    putStrLn "##############################################################"
