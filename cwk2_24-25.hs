type Horse = [String]


--HORSE
--Here are many horses with different stype
--I recommend "usHorse"

--empty horse
noHorse :: Horse
noHorse = ["","","","","","","","","","","","","",""]

--zero horse
zeroHorse :: Horse
zeroHorse = ["I am zero",""]

--test case horse
test :: Horse
test = 
  ["ABCD"
  ,"EFGH"
  ,"IJKL"
  ,"MNOP"
  ]

--Classic horse
horse :: Horse
horse =
  [ "     ,//)     "
  , "     ;;' \\    "
  , " ,;;' (  '\\   "
  , "     /  '\\_)  "
  ,""
  ]

--Sharp horse
sharpHorse :: Horse
sharpHorse = 
  ["                 #####        "
  ,"              ####  ###       "
  ,"          #####       ##      "
  ,"      #####        @   ##     "
  ,"   #####      ##        ##    "
  ,"####        ##  ###       ##  "
  ,"           ##      ###   ##   "
  ,"          ##          ###     "
  ,""
  ]

--Minus horse
minusHorse :: Horse
minusHorse = 
  ["               -----     "
  ,"           -----   --    "
  ,"       -----      + --   "
  ,"   -----       --    --  "
  ,"----          -- ---  -- "
  ,"             --     ---  "
  ,""
  ]

--American Horse. My favourite
usHorse :: Horse
usHorse =
  ["              $$$$     "
  ,"          $$$$$  $$    "
  ,"      $$$$$     * $$   "
  ," $$$$$$      $     $$  "
  ,"           $$ $$$   $$ "
  ,"         $$      $$$$  "
  ,""

  ]

oHorse :: Horse
oHorse = 
  ["          ooooooo      "
  ,"      oooOOO    Oo     "
  ,"   oooOO       $ Oo    "
  ,"oooOO       O     Oo   "
  ,"          ooOooo   Oo  "
  ,"         OO    oOOO    "
  ,""

  ]

sHorse :: Horse
sHorse = 
  ["           SssS        "
  ,"       SsssS   Sss     "
  ,"    SssS       O Ss    "
  ,"ssssS       s      Ss  "
  ,"          sS Sss    Ss "
  ,"         sS    SsssS   "
  ,""
  ]



--FUNCTION
--Here are the functions related to the horse

--Takes a horse and generates Multiple horses
horses :: Int -> Horse -> Horse
horses 0 _ = noHorse
horses n h = zipWith (++) h $ horses (n-1) h

--print horse
pretty :: Horse -> IO()
pretty = mapM_ putStrLn

--horse sequence
horseSeq :: (Int -> [Int]) -> Int -> Horse -> IO()
horseSeq f n h = mapM_ (\n -> if n > 0 then pretty $ horses n h else pretty zeroHorse) $ f n

--rotate horses to right 90 degree
transpose :: Horse -> Horse
transpose = transpose' . reverse --reverse each string in horses
    where
        transpose' :: Horse -> Horse
        transpose' [] = []
        transpose' xs
            | any null xs = []
            | otherwise = map head xs : transpose' (map tail xs)
            --perpend each string in horses vertically

--mirror horses vertically
mirror :: Horse -> Horse
mirror = map reverse

--rotate 180 to right
transpose180 :: Horse -> Horse
transpose180 = transpose . transpose

--rotate 270 to right
transpose270 :: Horse -> Horse
transpose270 = mirror . reverse


--SEQUENCE
--Here are some sequences

--unlimitied tribonacci
tribo :: [Int]
tribo = 0 : 0 : 1 : zipWith3 (\a b c -> a + b + c)
                                  tribo --a
                                  (tail tribo) --b
                                  (drop 2 tribo) --c

--limit the tribonacci
tribonacci :: Int -> [Int]
tribonacci n = take n tribo

--unlimited lazyCaterers
lazyCaterers :: [Int]
lazyCaterers = [ (n*(n+1)) `div` 2 + 1| n <- [0..] ]

--limit the lazyCaterer
lazyCaterer :: Int -> [Int]
lazyCaterer n = take n lazyCaterers

--MONADS
--Here are safe data types

--data Maybe a = Nothing | Just a
shead :: [a] -> Maybe a
shead []     = Nothing
shead (x:xs) = Just x

stail :: [a] -> Maybe [a]
stail []     = Nothing
stail (_:xs) = Just xs



--MAIN
--modify your code here

main :: IO()
main = do
    horseSeq tribonacci 5 sHorse
