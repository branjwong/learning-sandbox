module PutJSON where

import Data.List (intercalate)
import SimpleJSON

renderJValue :: JValue -> String
renderJValue value =
    case value of
        JString s -> show s
        JNumber n -> show n
        JBool True -> "True"
        JBool False -> "False"
        JNull -> "Null"
        JObject o -> "{" ++ pairs o ++ "}"
            where 
                pairs [] = ""
                pairs ps = intercalate ", " (map renderPair ps)
                renderPair (k,v) = show k ++ ": " ++ renderJValue v
        JArray a -> "[" ++ values a ++ "]"
            where
                values [] = ""
                values vs = intercalate ", " (map renderJValue vs)

putJValue :: JValue -> IO ()
putJValue v = putStrLn (renderJValue v)