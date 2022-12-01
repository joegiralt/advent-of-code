module Year2022.Day01 where

import AOC.Lib (parseInt10)
import Data.Array (span, sort, head, reverse)
import Data.Foldable (sum)
import Data.Function (($))
import Data.Functor (map)
import Data.Semigroup ((<>))
import Data.Unit (Unit)
import Effect (Effect)
import Effect.Ref (read)
import Effect.Class.Console (log)
import Data.List (sort)

--------------------------------------------------------------------------------
-- Write your solutions here

parseElfs s = map (map read) $ map (span "\n") $ span "\n\n" s

sortSumElfs = reverse . sort . (map sum)

part1 :: String -> Effect Unit
part1 input = do
  let result = "foo"
  log $ "Part 1 ==> " <> (head . sortSumElfs . parseElfs)

part2 :: String -> Effect Unit
part2 input = do
  let result = "<TODO>"
  log $ "Part 2 ==> " <> result

--------------------------------------------------------------------------------
