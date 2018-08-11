import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.FadeInactive
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myTerminal              = "urxvt"
myModMask               = mod4Mask
myNormalBorderColor     = "#969694"
myFocusedBorderColor    = "#77b2f6"

myXmonadBar = "dzen2 -x 0 -y 0 -w 500 -ta l -dock"
myStatusBar = "conky | dzen2 -x 500 -y 0 -ta r -dock"

main = do
    dzenLeftBar  <- spawnPipe myXmonadBar
    dzenRightBar <- spawnPipe myStatusBar
    xmonad $ desktopConfig
        {
          logHook               = myLogHook dzenLeftBar >> fadeInactiveLogHook 0xdddddddd
        , terminal              = myTerminal
        , modMask               = myModMask
        , normalBorderColor     = myNormalBorderColor
        , focusedBorderColor    = myFocusedBorderColor
        }

myLogHook :: Handle -> X ()
myLogHook h = dynamicLogWithPP $ def
    {
      ppCurrent = dzenColor "#f9a825" "" . pad
    , ppHidden  = dzenColor "#ffffff" "" . pad
    , ppUrgent  = dzenColor "#ff0000" "#ff0000" . pad
    , ppWsSep   = ""
    , ppSep     = "|"
    , ppLayout  = (>> "")
    , ppTitle   = (" " ++) . dzenColor "#f2f2f2" "" . shorten 50
    , ppOutput  = hPutStrLn h
    }
