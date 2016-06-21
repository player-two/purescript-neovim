module DefineJs where

import Prelude
import Data.Array (drop, head, range, snoc, uncons)
import Data.Foldable (foldl)
import Data.Maybe (maybe)
import Data.String (joinWith, replace)

header = "'use strict';\n\n"

-- defined in newer version of Data.Array
replicate :: forall a. Int -> a -> Array a
replicate 0 _ = []
replicate n v = map (\_ -> v) (range 1 n)

indent :: Int -> String
indent n = foldl (<>) "" (replicate (n * 2) " ")

open :: Int -> String -> String
open level arg = indent level <> (if level > 0 then "return " else "") <> "function (" <> arg <> ") {\n"

close :: Int -> String
close level = indent level <> "}\n"

mkFunc :: Int -> (Array String) -> (Int -> String) -> String
mkFunc level [] body = open level "" <> body (level + 1) <> close level
mkFunc level args body = maybe "" recurse (uncons args)
  where recurse { head: a, tail: rst } = open level a <> (mkFunc (level + 1) rst body) <> close level

defFunc :: String -> (Array String) -> (Int -> String) -> String
defFunc name args body = "exports[\"" <> name <> "'\"] = " <> mkFunc 0 args body

asyncFuncForm objName fname args a b = [ asyncFuncCall objName fname args <> "function (err, result) {"
                    , "  if (err) {"
                    , "    " <> a <> "(err)();"
                    , "  } else {"
                    , "    " <> b <> "(result)();"
                    , "  }"
                    , "});"
                    ]
  where asyncFuncCall objName fname args = objName <> "." <> replace "'" "" fname <> "(" <> foldl (\s a -> s <> a <> ", ") "" (drop 1 args)

defAsyncFunc :: String -> (Array String) -> String
defAsyncFunc name args = defFunc name (snoc (snoc args "error") "success") body
  where body level = foldl (<>) ""  <<< map (\s -> indent level <> s <> "\n") $ asyncFuncForm objName name args "error" "success"
        objName = maybe "" id (head args)