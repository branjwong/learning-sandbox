import System.IO
import qualified System.Directory as Directory
import qualified System.IO.Error as Error
import qualified Control.Exception as Exception

main :: IO ()
main = 
    -- withTempFile closes and deletes mytemp.txt
    withTempFile "mytemp.txt" myAction


myAction :: FilePath -> Handle -> IO ()
myAction tempname temph =
    do
        -- display a greeting
        putStrLn "Welcome to tempfile.hs"
        putStrLn $ "My initial position is " ++ show tempname

        pos <- hTell temph
        putStrLn $ "My initial position is " ++ show pos

        let tempdata = show [1..10]
        putStrLn $ 
            "Writing one line containing " ++ 
            show (length tempdata) ++ " bytes: " ++
            tempdata
        hPutStrLn temph tempdata

        pos <- hTell temph
        putStrLn $ "After writing, my new position is " ++ show pos

        putStrLn $ "The file content is: "
        hSeek temph AbsoluteSeek 0
        c <- hGetContents temph

        putStrLn c
        putStrLn $ "Which could be expressed as this Haskell literal:"
        print c

withTempFile :: String -> (FilePath -> Handle -> IO a) -> IO a
withTempFile pattern func =
    do
        tempdir <- Error.catchIOError Directory.getTemporaryDirectory (\_ -> return ".")
        (tempfile, temph) <- openTempFile tempdir pattern

        Exception.finally 
            (func tempfile temph)
            (do
                hClose temph
                Directory.removeFile tempfile
            )
