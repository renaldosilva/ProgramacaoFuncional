module TestQ4 (runTestsQ4) where

import Questions (
    Queue(..),
    isEmptyQueue,
    enqueue,
    dequeue,
    peekQueue,
    size
    )

import Util (
    getTestStatus,
    printResultQ3Q4V1,
    printResultQ3Q4V2,
    printResultQ3Q4V3,
    printResultQ3Q4V4
    )

-- ###################### Testes Questão 4 ######################

-- Fila = [] | head = Nothing
emptyQueue :: Queue Int
emptyQueue = Queue []

-- Fila = [6] | head = 6
queueOfOneElement :: Queue Int
queueOfOneElement = queue 
    where
        new = emptyQueue
        queue = enqueue new 6

-- Fila = [7, 23, 255, 80, 1] | head = 7
queueOfMultipleElements :: Queue Int
queueOfMultipleElements = queue
    where 
        new = emptyQueue
        queue = enqueue (enqueue (enqueue (enqueue (enqueue new 7) 23) 255) 80) 1

testIsEmptyName :: [Char]
testIsEmptyName = "\x1b[36mTest 'isEmptyQueue'\x1b[0m"

testIsEmptyOnEmptyQueue :: IO()
testIsEmptyOnEmptyQueue = do
    let queue = emptyQueue
    let result = isEmptyQueue queue
    let testStatus = getTestStatus True result
    printResultQ3Q4V1 testIsEmptyName queue True result testStatus

testIsEmptyWithPopulatedQueue :: IO()
testIsEmptyWithPopulatedQueue = do
    let queue = queueOfMultipleElements
    let result = isEmptyQueue queue
    let testStatus = getTestStatus False result
    printResultQ3Q4V1 testIsEmptyName queue False result testStatus

testEnqueueName :: [Char]
testEnqueueName = "\x1b[36mTest 'enqueue'\x1b[0m"

testEnqueueOnEmptyQueue :: IO()
testEnqueueOnEmptyQueue = do
    let queue = emptyQueue
    let value = 3
    let newQueue = enqueue queue value
    let expectedQueue = Queue [value]
    let testStatus = getTestStatus expectedQueue newQueue
    printResultQ3Q4V2 testEnqueueName queue value expectedQueue newQueue testStatus

testEnqueueWithPopulatedQueue :: IO()
testEnqueueWithPopulatedQueue = do
    let queue = queueOfMultipleElements
    let value = 23
    let newQueue = enqueue queue value
    let expectedQueue = Queue [7, 23, 255, 80, 1, value]
    let testStatus = getTestStatus expectedQueue newQueue
    printResultQ3Q4V2 testEnqueueName queue value expectedQueue newQueue testStatus

testDequeueName :: [Char]
testDequeueName = "\x1b[36mTest 'dequeue'\x1b[0m"

testDequeueOnEmptyQueue :: IO ()
testDequeueOnEmptyQueue = do
    let queue = emptyQueue
    let result = dequeue queue
    let expectedResult = (Queue [], Nothing)
    let testStatus = getTestStatus expectedResult result
    printResultQ3Q4V3 testDequeueName queue expectedResult result testStatus

testDequeueWithPopulatedQueue1 :: IO()
testDequeueWithPopulatedQueue1 = do
    let queue = queueOfOneElement
    let result = dequeue queue
    let expectedResult = (Queue [], Just 6)
    let testStatus = getTestStatus expectedResult result
    printResultQ3Q4V3 testDequeueName queue expectedResult result testStatus

testDequeueWithPopulatedQueue2 :: IO()
testDequeueWithPopulatedQueue2 = do
    let queue = queueOfMultipleElements
    let result = dequeue queue
    let expectedResult = (Queue [23, 255, 80, 1], Just 7)
    let testStatus = getTestStatus expectedResult result
    printResultQ3Q4V3 testDequeueName queue expectedResult result testStatus

testPeekName :: [Char]
testPeekName = "\x1b[36mTest 'peekQueue'\x1b[0m"

testPeekQueueOnEmptyQueue :: IO()
testPeekQueueOnEmptyQueue = do
    let queue = emptyQueue
    let result = peekQueue queue
    let expectedResult = Nothing
    let testStatus = getTestStatus expectedResult result
    printResultQ3Q4V4 testPeekName queue expectedResult result testStatus

testQueueWithPopulatedQueue :: IO()
testQueueWithPopulatedQueue = do
    let queue = queueOfMultipleElements
    let result = peekQueue queue
    let expectedResult = Just 7
    let testStatus = getTestStatus expectedResult result
    printResultQ3Q4V4 testPeekName queue expectedResult result testStatus

testSizeName :: [Char]
testSizeName = "\x1b[36mTest 'size'\x1b[0m"

testSizeOnEmptyQueue :: IO()
testSizeOnEmptyQueue = do
    let queue = emptyQueue
    let result = Just (size queue)
    let expectedResult = Just 0
    let testStatus = getTestStatus expectedResult result
    printResultQ3Q4V4 testSizeName queue expectedResult result testStatus

testSizeWithPopulatedQueue :: IO()
testSizeWithPopulatedQueue = do
    let queue = queueOfMultipleElements
    let result = Just (size queue)
    let expectedResult = Just 5
    let testStatus = getTestStatus expectedResult result
    printResultQ3Q4V4 testSizeName queue expectedResult result testStatus

runTestsQ4 :: IO()
runTestsQ4 = do
    testIsEmptyOnEmptyQueue
    testIsEmptyWithPopulatedQueue
    testEnqueueOnEmptyQueue
    testEnqueueWithPopulatedQueue
    testDequeueOnEmptyQueue
    testDequeueWithPopulatedQueue1
    testDequeueWithPopulatedQueue2
    testPeekQueueOnEmptyQueue
    testQueueWithPopulatedQueue
    testSizeOnEmptyQueue
    testSizeWithPopulatedQueue

main :: IO()
main = do
    putStrLn "###################### Testes Questão 4 ######################"
    putStrLn ""
    runTestsQ4
    putStrLn "##############################################################"
