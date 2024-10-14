# ProgramacaoFuncional ⚙️

## Sumário
1. [Descrição do Projeto](#1-descrição-do-projeto)
   - [Questões](#questões)
2. [Instalação do Haskell](#2-instalação-do-haskell)
3. [Execução dos Testes](#3-execução-dos-testes)
   - [Executando Testes Separadamente](#31-executando-testes-separadamente)
   - [Executando Todos os Testes Simultaneamente](#32-executando-todos-os-testes-simultaneamente)

## 1. Descrição do Projeto
Conjunto de questões práticas sobre programação funcional, desenvolvidas em Haskell.

### Questões
1. Dado um array ordenado e um número x, encontre um par (a,b) de números pertencentes ao array tal que (a + b) se aproxime o máximo possível de x.
2. Encontrar floor e ceil de um número x dentro de um array a. O número x pode não estar no array a. O floor(x) é o número do array a que é menor que x e que mais se aproxima de x (pode existir mais de um número menor que x, o floor é o maior deles). Dualmente, o ceil(x)  é o número do array a que é maior que x e que mais se aproxima de x (pode existir mais de um número maior do que x, o ceil é o menor deles).
3. Implementar uma pilha e seus algoritmos em Haskell. Use a lista de Haskell como estrutura sobrejacente e operações que não sejam acesso pelo índice.
4. Implementar uma Fila e seus algoritmos em Haskell. Use a lista de Haskell como estrutura sobrejacente e operações que não sejam acesso pelo índice.
5. Um aluno é representado como uma estrutura contando matrícula, um primeiro nome, um sobrenome, período de ingresso e CRA.
    - a) Implemente a estrutura que representa um aluno
    - b) Implemente uma função que calcula a média dos CRAs dos alunos (dispostos em uma lista) usando o operador de foldr (você não pode usar map).
    - c ) Implemente uma função que realiza o groupBy dos alunos por CRA. Ou seja, dada uma lista de alunos, a função retorna uma lista de pares (cra, [Aluno]), agrupando alunos com um mesmo CRA em pares cujo primeiro elemento é o CRA e o segundo é uma lista de alunos.

## 2. Instalação do Haskell
Recomendo o uso do [GHCup](https://www.haskell.org/ghcup/), uma ferramenta que facilita a instalação do GHC (Glasgow Haskell Compiler) e de outros componentes essenciais para o desenvolvimento em Haskell.

## 3. Execução dos Testes
Primeiro, faça o download do projeto e acesse o diretório `ProgramacaoFuncional/src/` no terminal. Para isso, utilize o seguinte comando:
```bash
$ cd ProgramacaoFuncional/src/
```
### 3.1 Executando Testes Separadamente
Para executar os testes individualmente de cada questão, utilize o seguinte comando, substituindo `<?>` pelo número da questão que você deseja testar:
```bash
$ ghci TestQ<?>.hs
```
Após executar o comando, você deve ver uma saída semelhante a esta. Basta digitar o comando `main` para rodar os testes:
```bash
ghci> main
```
### 3.2 Executando Todos os Testes Simultaneamente
Se preferir, você pode executar todos os testes de uma só vez. Para isso, utilize o seguinte comando:
```bash
$ ghci TestAll.hs
```
Novamente, você deve ver uma saída semelhante a esta. Execute o comando `main` para rodar todos os testes:
```bash
ghci> main
```

