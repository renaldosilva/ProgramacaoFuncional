module Util (
    printResultQ1,
    printResultQ2,
    printResultQ3V1,
    printResultQ3V2,
    printResultQ3V3,
    printResultQ3V4,
    printResultQ3V5
) where

import Questions (Stack)


printResultQ1 :: [Int] -> Int -> (Int, Int) -> (Int, Int) -> IO()
printResultQ1 array x expectedResult result = do
    putStrLn $ "Input: arr[] = " ++ show array ++ ", x = " ++ show x
    putStrLn $ "Expected result: " ++ show expectedResult
    putStrLn $ "Result: " ++ show result
    putStrLn ""

printResultQ2 :: [Int] -> Int -> (Int, Int) -> (Int, Int) -> IO()
printResultQ2 array x expectedResult result = do 
    putStrLn $ "Input: arr[] = " ++ show array ++ ", x = " ++ show x
    putStrLn $ "Expected result: floor = " ++ show (fst expectedResult) ++ ", ceil = " ++ show (snd expectedResult)
    putStrLn $ "Result: floor = " ++ show (fst result) ++ ", ceil = " ++ show (snd result)
    putStrLn ""

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
