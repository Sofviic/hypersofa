module Input where

import Game (Game, World)
import Graphics.Gloss
import Graphics.Gloss.Interface

inputHandle :: Event -> Game -> Game
inputHandle _ g = g