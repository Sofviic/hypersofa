{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DeriveAnyClass #-}
module Game where

import Data.Map (Map)
import Data.Modular
import Data.MemoTrie

data Tile = TEmpty | TGrass | TWater
newtype Coord a = Coord (a, a)

-- Series of turns by n followed by going forward
data HyperCoord = HyperCoord [ℤ/8] deriving (HasTrie, Eq)
newtype HyperCoordFloat = HyperCoordFloat (HyperCoord, Coord Float)

-- instance Foldable HyperCoord where
--     foldr _ acc (HyperCoord [])     = acc
--     foldr f acc (HyperCoord (x:xs)) = foldr f (f x acc) (HyperCoord xs)
--     foldMap f (HyperCoord []) = mempty
--     foldMap f (HyperCoord (x:xs)) = f x <> foldMap f (HyperCoord xs)

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

