-- file: ch03/Add.hs

-- Defining a function as a series of equations
myNot True = False
myNot False = True

sumList (x:xs) = x + sumList xs
sumList [] = 0

third (a, b, c) = c
