module Main where

import Game (startGame, Game, World, Camera)
import Graphics (renderGame, tick)
import Input (inputHandle)
import Graphics.Gloss

{- Setup -}
winSize :: (Int,Int)
winSize = (800, 500)

winPos :: (Int,Int)
winPos = (0,0)

fps :: Int
fps = 30

{- Main -}
main :: IO ()
main = play
    InWindow "Hypersofa but Haskell is stupid" winSize winPos
    fps
    startGame
    renderGame
    inputHandle
    animateGame
