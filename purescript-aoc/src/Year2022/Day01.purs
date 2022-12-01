module Year2022.Day01 where

import AOC.Lib (parseInt10)
import Data.Array as A
import Data.Function (($))
import Data.Semigroup ((<>))
import Data.Unit (Unit)
import Effect (Effect)
import Effect.Class.Console (log)
import Data.String.Utils (lines)


--------------------------------------------------------------------------------
-- Write your solutions here

part1 :: String -> Effect Unit
part1 input = do
  let entries = A.mapMaybe parseInt10 $ lines input
  let result = "foo"
  log $ "Part 1 ==> " <> result

part2 :: String -> Effect Unit
part2 input = do
  let result = "<TODO>"
  log $ "Part 2 ==> " <> result

--------------------------------------------------------------------------------
