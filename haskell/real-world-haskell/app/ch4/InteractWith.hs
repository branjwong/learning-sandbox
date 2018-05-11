-- file: ch04/InteractWith.hs
-- Save this in a source file, e.g. Interact.hs

import System.Environment (getArgs)

interactWith function inputFile outputFile = do
    input <- readFile inputFile
    writeFile outputFile (function input)

main = do
    args <- getArgs
    case args of
        [input,output] -> interactWith myFunction input output
        _ -> putStrLn "error: exactly two arguments needed"

myFunction :: String -> String
myFunction inputString =
    "no thanks"
