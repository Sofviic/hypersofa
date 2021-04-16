module Game where
import Data.Map (Map)

data Tile = Empty | Floor

newtype Coord a = Coord (a, a)

data Camera = Camera {
    camPosition :: Coord Double,
    camZoom :: Double
}

data World = World {
    worldTiles :: Map (Coord Integer) Tile
}

data Game = Game {
    gameWorld :: World,
    gameCamera :: Camera
}

startGame :: Game
startGame = undefined