module Util (
    getTestStatus,
    printResultQ1,
    printResultQ2,
    printResultQ3V1,
    printResultQ3V2,
    printResultQ3V3,
    printResultQ3V4,
    printResultQ3V5
) where

import Questions (Stack)


getTestStatus :: (Eq t) => t -> t -> [Char]
getTestStatus expectedResult result = if result == expectedResult then "\x1b[32mOK\x1b[0m" else "\x1b[31mFAIL\x1b[0m"

printResultQ1 :: [Char] -> [Int] -> Int -> (Int, Int) -> (Int, Int) -> [Char] -> IO()
printResultQ1 testName list x expectedResult result testStatus = do
    putStrLn testName
    putStrLn $ "Input: arr[] = " ++ show list ++ ", x = " ++ show x
    putStrLn $ "Expected result: " ++ show expectedResult 
    putStrLn $ "Result: " ++ show result
    putStrLn $ "Test Status: " ++ testStatus
    putStrLn ""

printResultQ2 :: [Char] -> [Int] -> Int -> (Int, Int) -> (Int, Int) -> [Char] -> IO()
printResultQ2 testName list x expectedResult result testStatus = do 
    putStrLn testName
    putStrLn $ "Input: arr[] = " ++ show list ++ ", x = " ++ show x
    putStrLn $ "Expected result: floor = " ++ show (fst expectedResult) ++ ", ceil = " ++ show (snd expectedResult)
    putStrLn $ "Result: floor = " ++ show (fst result) ++ ", ceil = " ++ show (snd result)
    putStrLn $ "Test Status: " ++ testStatus
    putStrLn ""

printResultQ3V1 :: [Char] -> Stack Int -> Bool -> Bool -> [Char] -> IO()
printResultQ3V1 testName stack expectedResult result testStatus = do
    putStrLn testName
    print stack
    putStrLn $ "Expected result: " ++ show expectedResult
    putStrLn $ "Result: " ++ show result
    putStrLn $ "Test Status: " ++ testStatus
    putStrLn ""

printResultQ3V2 :: [Char] -> Stack Int -> Int -> Stack Int -> Stack Int -> [Char] -> IO()
printResultQ3V2 testName stack value expectedResult result testStatus = do
    putStrLn testName
    print stack
    putStrLn $ "Value: " ++ show value
    putStrLn $ "Expected result: " ++ show expectedResult
    putStrLn $ "Result: " ++ show result
    putStrLn $ "Test Status: " ++ testStatus
    putStrLn ""

printResultQ3V3 :: [Char] -> Stack Int -> (Stack Int, Maybe Int) -> (Stack Int, Maybe Int) -> [Char] ->IO()
printResultQ3V3 testName stack expectedResult result testStatus = do
    putStrLn testName
    print stack
    putStrLn $ "Expected result: " ++ show expectedResult
    putStrLn $ "Result: " ++ show result
    putStrLn $ "Test Status: " ++ testStatus
    putStrLn ""

printResultQ3V4 :: [Char] -> Stack Int -> Maybe Int -> Maybe Int -> [Char] -> IO()
printResultQ3V4 testName stack expectedResult result testStatus = do
    putStrLn testName
    print stack
    putStrLn $ "Expected result: " ++ show expectedResult
    putStrLn $ "Result: " ++ show result
    putStrLn $ "Test Status: " ++ testStatus
    putStrLn ""

printResultQ3V5 :: [Char] -> Stack Int -> Int -> Maybe Int -> Maybe Int -> [Char] -> IO()
printResultQ3V5 testName stack value expectedResult result testStatus = do
    putStrLn testName
    print stack
    putStrLn $ "Value: " ++ show value
    putStrLn $ "Expected result: " ++ show expectedResult
    putStrLn $ "Result: " ++ show result
    putStrLn $ "Test Status: " ++ testStatus
    putStrLn ""
