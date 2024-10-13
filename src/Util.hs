module Util (
    getTestStatus,
    printResultQ1,
    printResultQ2,
    printResultQ3Q4V1,
    printResultQ3Q4V2,
    printResultQ3Q4V3,
    printResultQ3Q4V4,
    printResultQ3V5
) where

import Questions (Stack, Queue)


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

printResultQ3Q4V1 :: (Show t) => [Char] -> t -> Bool -> Bool -> [Char] -> IO()
printResultQ3Q4V1 testName structure expectedResult result testStatus = do
    putStrLn testName
    print structure
    putStrLn $ "Expected result: " ++ show expectedResult
    putStrLn $ "Result: " ++ show result
    putStrLn $ "Test Status: " ++ testStatus
    putStrLn ""

printResultQ3Q4V2 :: (Show t) => [Char] -> t -> Int -> t -> t -> [Char] -> IO()
printResultQ3Q4V2 testName structure value expectedResult result testStatus = do
    putStrLn testName
    print structure
    putStrLn $ "Value: " ++ show value
    putStrLn $ "Expected result: " ++ show expectedResult
    putStrLn $ "Result: " ++ show result
    putStrLn $ "Test Status: " ++ testStatus
    putStrLn ""

printResultQ3Q4V3 :: (Show t) => [Char] -> t -> (t, Maybe Int) -> (t, Maybe Int) -> [Char] ->IO()
printResultQ3Q4V3 testName structure expectedResult result testStatus = do
    putStrLn testName
    print structure
    putStrLn $ "Expected result: " ++ show expectedResult
    putStrLn $ "Result: " ++ show result
    putStrLn $ "Test Status: " ++ testStatus
    putStrLn ""

printResultQ3Q4V4 :: (Show t) => [Char] -> t -> Maybe Int -> Maybe Int -> [Char] -> IO()
printResultQ3Q4V4 testName structure expectedResult result testStatus = do
    putStrLn testName
    print structure
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
