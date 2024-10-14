import TestQ1 (runTestsQ1)
import TestQ2 (runTestsQ2)
import TestQ3 (runTestsQ3)
import TestQ4 (runTestsQ4)
import TestQ5 (runTestsQ5)


main :: IO()
main = do
    putStrLn "###################### Testes Questão 1 ######################"
    putStrLn ""
    runTestsQ1
    putStrLn "##############################################################"
    putStrLn ""
    putStrLn ""
    putStrLn "###################### Testes Questão 2 ######################"
    putStrLn ""
    runTestsQ2
    putStrLn "##############################################################"
    putStrLn ""
    putStrLn ""
    putStrLn "###################### Testes Questão 3 ######################"
    putStrLn ""
    runTestsQ3
    putStrLn "##############################################################"
    putStrLn ""
    putStrLn ""
    putStrLn "###################### Testes Questão 4 ######################"
    putStrLn ""
    runTestsQ4
    putStrLn "##############################################################"
    putStrLn ""
    putStrLn ""
    putStrLn "###################### Testes Questão 5 ######################"
    putStrLn ""
    runTestsQ5
    putStrLn "##############################################################"
