import TestQ1 (runTestsQ1)
import TestQ2 (runTestsQ2)
import TestQ3 (runTestsQ3)


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
    