module TestQ5 (runTestsQ5) where

import Questions (
    Student(..),
    calculateAverageCra, 
    groupByCra
    )
import Util (
    getTestStatus,
    printResultQ5V1,
    printResultQ5V2
    )


-- ###################### Testes Questão 5 ######################

emptyStudents :: [Student]
emptyStudents = []

studentsWithDifferentCra :: [Student]
studentsWithDifferentCra = [
    Student {registration = "12994577", name = "Afonso", surname = "Martins", entryPeriod = "2018.1", cra = 8.2},
    Student {registration = "13522111", name = "Angelina", surname = "Santos", entryPeriod = "2020.2", cra = 7.8},
    Student {registration = "13522111", name = "Matheus", surname = "Alves", entryPeriod = "2021.1", cra = 6.5}
    ]

studentsWithEqualCra :: [Student]
studentsWithEqualCra = [
    Student {registration = "12994577", name = "Alex", surname = "Souza", entryPeriod = "2019.2", cra = 8.6},
    Student {registration = "13522111", name = "Maria", surname = "Carvalho", entryPeriod = "2022.1", cra = 8.6},
    Student {registration = "13522111", name = "Amanda", surname = "Fialho", entryPeriod = "2022.1", cra = 8.6}
    ]

studentsWithCraSubgroups :: [Student]
studentsWithCraSubgroups = [
    Student {registration = "12994577", name = "Marla", surname = "Silva", entryPeriod = "2023.1", cra = 7.6},
    Student {registration = "13522111", name = "Natan", surname = "Silva", entryPeriod = "2022.2", cra = 7.6},
    Student {registration = "13522111", name = "Kaua", surname = "Machado", entryPeriod = "2022.2", cra = 6.1}
    ]

testCraAverageWithEmptyList :: IO()
testCraAverageWithEmptyList = do
    let testName = "\x1b[36mTest CRA average with empty list\x1b[0m"
    let students = emptyStudents
    let result = calculateAverageCra students
    let expectedResult = 0.0
    let testStatus = getTestStatus expectedResult result
    printResultQ5V1 testName students expectedResult result testStatus

testCraAverageWithPopulatedList1:: IO()
testCraAverageWithPopulatedList1 = do
    let testName = "\x1b[36mTest CRA average with populated list 1\x1b[0m"
    let students = studentsWithDifferentCra
    let result = calculateAverageCra students
    let expectedResult = 7.5
    let testStatus = getTestStatus expectedResult result
    printResultQ5V1 testName students expectedResult result testStatus

testCraAverageWithPopulatedList2:: IO()
testCraAverageWithPopulatedList2 = do
    let testName = "\x1b[36mTest CRA average with populated list 2\x1b[0m"
    let students = studentsWithEqualCra
    let result = calculateAverageCra students
    let expectedResult = 8.6
    let testStatus = getTestStatus expectedResult result
    printResultQ5V1 testName students expectedResult result testStatus

testGroupByCraWithEmptyList :: IO()
testGroupByCraWithEmptyList = do
    let testName = "\x1b[36mTest 'groupByCra' with empty list\x1b[0m"
    let students = emptyStudents
    let result = groupByCra students
    let expectedResult = []
    let testStatus = getTestStatus expectedResult result
    printResultQ5V2 testName students expectedResult result testStatus

testGroupByCraWithPopulatedList1 :: IO()
testGroupByCraWithPopulatedList1 = do
    let testName = "\x1b[36mTest 'groupByCra' with populated list - Different CRAs\x1b[0m"
    let students = studentsWithDifferentCra
    let result = groupByCra students
    let expectedResult = [(6.5, [Student {registration = "13522111", name = "Matheus", surname = "Alves", entryPeriod = "2021.1", cra = 6.5}]),
                          (7.8, [Student {registration = "13522111", name = "Angelina", surname = "Santos", entryPeriod = "2020.2", cra = 7.8}]),
                          (8.2, [Student {registration = "12994577", name = "Afonso", surname = "Martins", entryPeriod = "2018.1", cra = 8.2}])
                          ]
    let testStatus = getTestStatus expectedResult result
    printResultQ5V2 testName students expectedResult result testStatus

testGroupByCraWithPopulatedList2 :: IO()
testGroupByCraWithPopulatedList2 = do
    let testName = "\x1b[36mTest 'groupByCra' with populated list - Equal CRAs\x1b[0m"
    let students = studentsWithEqualCra
    let result = groupByCra students
    let expectedResult = [(8.6, [Student {registration = "12994577", name = "Alex", surname = "Souza", entryPeriod = "2019.2", cra = 8.6},
                                 Student {registration = "13522111", name = "Maria", surname = "Carvalho", entryPeriod = "2022.1", cra = 8.6},
                                 Student {registration = "13522111", name = "Amanda", surname = "Fialho", entryPeriod = "2022.1", cra = 8.6}]
                            )
                          ]
    let testStatus = getTestStatus expectedResult result
    printResultQ5V2 testName students expectedResult result testStatus

testGroupByCraWithPopulatedList3 :: IO()
testGroupByCraWithPopulatedList3 = do
    let testName = "\x1b[36mTest 'groupByCra' with populated list - Subgroups CRAs\x1b[0m"
    let students = studentsWithCraSubgroups
    let result = groupByCra students
    let expectedResult = [(6.1, [Student {registration = "13522111", name = "Kaua", surname = "Machado", entryPeriod = "2022.2", cra = 6.1}]),
                          (7.6, [Student {registration = "12994577", name = "Marla", surname = "Silva", entryPeriod = "2023.1", cra = 7.6},
                                 Student {registration = "13522111", name = "Natan", surname = "Silva", entryPeriod = "2022.2", cra = 7.6}]
                            )
                          ]
    let testStatus = getTestStatus expectedResult result
    printResultQ5V2 testName students expectedResult result testStatus

runTestsQ5 :: IO()
runTestsQ5 = do
    testCraAverageWithEmptyList
    testCraAverageWithPopulatedList1
    testCraAverageWithPopulatedList2
    testGroupByCraWithEmptyList
    testGroupByCraWithPopulatedList1
    testGroupByCraWithPopulatedList2
    testGroupByCraWithPopulatedList3

main :: IO()
main = do
    putStrLn "###################### Testes Questão 5 ######################"
    putStrLn ""
    runTestsQ5
    putStrLn "##############################################################"
