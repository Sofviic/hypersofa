module HyperCoord where


import Game


instance Num HyperCoord where
    (HyperCoord a) + (HyperCoord b) = HyperCoord (a ++ b)
    (HyperCoord a) * (HyperCoord b) = HyperCoord (a ++ b) 
    negate (HyperCoord a) = HyperCoord $ map negate a
    abs (HyperCoord a) = HyperCoord $ map abs a
    signum (HyperCoord a) = HyperCoord $ map signum a
    fromInteger a = HyperCoord [fromInteger a]

hyperCoordToEnum :: Int -> [ℤ/8]
hyperCoordToEnum 0 = []
hyperCoordToEnum x = [toEnum (x `mod` 8)] ++ hyperCoordToEnum (x `div` 8)

instance Enum HyperCoord where
    fromEnum (HyperCoord []    ) = 0
    fromEnum (HyperCoord (x:xs)) = fromEnum x + 8 * fromEnum (HyperCoord xs)
    toEnum = HyperCoord . hyperCoordToEnum
