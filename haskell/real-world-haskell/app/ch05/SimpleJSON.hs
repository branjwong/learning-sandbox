-- file: ch05/SimpleJSON.hs
module SimpleJSON
    ( JValue(..)
    , getString
    , getNumber
    ) where


data JValue 
    = JString String
    | JNumber Double
    | JBool Bool
    | JNull
    | JObject [(String, JValue)]
    | JArray [JValue]
    deriving (Eq, Ord, Show)

getString :: JValue -> Maybe String
getString (JString s) = Just s
getString _ = Nothing

getNumber :: JValue -> Maybe Double
getNumber (JNumber d) = Just d
getNumber _ = Nothing
