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
        worldTiles = trie $ const TEmpty
    }
}

