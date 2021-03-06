module Grg.Util where

import Dict as D

-- Dictionary-related
updateWithDefault : a -> comparable -> (a -> a) -> D.Dict comparable a -> D.Dict comparable a
updateWithDefault def name fn dict = D.insert name (fn <| D.findWithDefault def name dict) dict

incDict d table = let inc (name, amt) d = updateWithDefault 0 name ((+) amt) d
                  in foldr inc d table

decDict d table = let dec (name, amt) d = updateWithDefault 0 name (\n -> n - amt) d
                  in foldr dec d table

find0 key dict = D.findWithDefault 0 key dict

-- Boolean comparison related
gt : Order -> Bool
gt b = if GT == b then True else False

lt : Order -> Bool
lt b = if LT == b then True else False

eq : Order -> Bool
eq b = if LT == b then True else False

gtOrEq b = or [ gt b, eq b ]
