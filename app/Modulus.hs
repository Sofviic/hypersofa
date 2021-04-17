module Modulus where






-- data Z8 = Zero | One | Two | Three | Four | Five | Six | Seven

-- z8ToInt :: Z8 -> Integer
-- z8ToInt Zero  = 0
-- z8ToInt One   = 1
-- z8ToInt Two   = 2
-- z8ToInt Three = 3
-- z8ToInt Four  = 4
-- z8ToInt Five  = 5
-- z8ToInt Six   = 6
-- z8ToInt Seven = 7

-- intToZ8 :: Integer -> Z8
-- intToZ8 0 = Zero
-- intToZ8 1 = One
-- intToZ8 2 = Two
-- intToZ8 3 = Three
-- intToZ8 4 = Four
-- intToZ8 5 = Five
-- intToZ8 6 = Six
-- intToZ8 7 = Seven

-- instance Num Z8 where
--     fromInteger = intToZ8
--     x + y = intToZ8 $ ((z8ToInt x) + (z8ToInt y)) `mod` 8
--     x * y = intToZ8 $ ((z8ToInt x) * (z8ToInt y)) `mod` 8
--     negate y = intToZ8 $ (- (z8ToInt y)) `mod` 8
--     abs = id
--     signum = const One
