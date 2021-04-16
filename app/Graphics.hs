module Graphics where

import Game (Game, World, Camera)
import Graphics.Gloss

renderGame :: Game -> Picture
renderGame game = Blank

tick :: Float -> Game -> Game
tick t g = g