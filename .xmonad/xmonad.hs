import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Actions.CycleWS
import XMonad.Actions.UpdatePointer
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Hooks.EwmhDesktops
import System.IO

myTerminal              = "urxvt"
myModMask               = mod4Mask
myNormalBorderColor     = "#969694"
myFocusedBorderColor    = "#77b2f6"

myXmonadBar = "dzen2 -x 0 -y 0 -w 500 -ta l -dock -e 'button3:'"
myStatusBar = "conky | dzen2 -x 500 -y 0 -ta r -dock -e 'button3:'"

main = do
    dzenLeftBar  <- spawnPipe myXmonadBar
    dzenRightBar <- spawnPipe myStatusBar
    xmonad $ ewmh desktopConfig
        {
          logHook               = myLogHook dzenLeftBar >> updatePointer (0.95, 0.05) (0, 0) >> fadeInactiveLogHook 0xdddddddd
        , layoutHook            = smartSpacing 5 $ smartBorders $ avoidStruts $ layoutHook defaultConfig
        , terminal              = myTerminal
        , modMask               = myModMask
        , normalBorderColor     = myNormalBorderColor
        , focusedBorderColor    = myFocusedBorderColor
        }
        `additionalKeys`
        [
          ((myModMask, xK_p), spawn "rofi -show combi"),
          ((myModMask, xK_o), toggleWS)
        ]

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
