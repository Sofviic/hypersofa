{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DeriveAnyClass #-}
module Game where

import Data.Map (Map)
import Data.Modular
import Data.MemoTrie

data Tile = Empty | Floor

newtype Coord a = Coord (a, a)

-- Series of turns by n followed by going forward
data HyperCoord = HyperCoord [ℤ/8] deriving (HasTrie, Eq)
newtype HyperCoordFloat = HyperCoordFloat (HyperCoord, Coord Float)

-- instance Foldable HyperCoord where
--     foldr _ acc (HyperCoord [])     = acc
--     foldr f acc (HyperCoord (x:xs)) = foldr f (f x acc) (HyperCoord xs)
--     foldMap f (HyperCoord []) = mempty
--     foldMap f (HyperCoord (x:xs)) = f x <> foldMap f (HyperCoord xs)

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

data Camera = Camera {
    camPosition :: HyperCoordFloat,
    camZoom :: Double
}

data World = World {
    worldTiles :: HyperCoord :->: Tile
}

data Game = Game {
    gameWorld :: World,
    gameCamera :: Camera
}

startGame :: Game
startGame = Game {
    gameWorld = World {
        worldTiles = trie $ const Empty
    }
}

