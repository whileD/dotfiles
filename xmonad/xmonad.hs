import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.Run

import XMonad.Layout
import XMonad.Layout.DragPane
import XMonad.Layout.Gaps
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.ToggleLayouts

tall = ResizableTall 1 (3/100) (1/2) []

gapwidth  = 4
gwU = 2
gwD = 2
gwL = 4
gwR = 4
  
colorBlue      = "#857da9"
colorGreen     = "#88b986"
colorRed       = "#ff005f"
colorGray      = "#676767"
colorWhite     = "#d3d7cf"
colorGrayAlt   = "#313131"
colorNormalbg  = "#1a1e1b"

myBorderWidth = 4
myNormalBorderColor   = "#262626"
myFocusedBorderColor  = "#ededed"

myLogHook proc = dynamicLogWithPP $ xmobarPP
  { ppOutput              = hPutStrLn proc
  , ppOrder               = \(ws:l:t:_) -> [ws,t]
  , ppCurrent             = xmobarColor   colorGreen       colorNormalbg
  , ppUrgent              = xmobarColor   colorWhite       colorNormalbg
  , ppVisible             = xmobarColor   colorWhite       colorNormalbg
  , ppHidden              = xmobarColor   colorWhite       colorNormalbg
  , ppHiddenNoWindows     = xmobarColor   colorGray        colorNormalbg
  , ppTitle               = xmobarColor   colorWhite       colorNormalbg
  , ppWsSep               = ""
  , ppSep                 = "  ::: "
  }

main = do
  xmproc <- spawnPipe "xmobar $HOME/.xmonad/xmobarrc"
  xmonad $ docks defaultConfig
    { terminal = "terminator"
    , borderWidth = myBorderWidth
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , logHook = myLogHook xmproc
    , layoutHook = avoidStruts $ myLayout
    , manageHook = manageHook defaultConfig <+> manageDocks
    , handleEventHook = fullscreenEventHook}

myLayout = spacing gapwidth $ gaps [(U, gwU),(D, gwD),(L, gwL),(R, gwR)]
  $ (ResizableTall 1 (1/205) (120/205) [])


