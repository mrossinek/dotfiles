import XMonad
import qualified XMonad.StackSet as W
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Actions.FloatKeys
import XMonad.Actions.CycleWS
import XMonad.Actions.UpdatePointer
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.NamedScratchpad
import XMonad.Hooks.EwmhDesktops
import System.IO

myTerminal              = "alacritty"
myModMask               = mod4Mask
myNormalBorderColor     = "#969694"
myFocusedBorderColor    = "#77b2f6"

myXmonadBar = "dzen2 -x 72 -y 0 -w 1000 -ta l -dock -e 'button3:'"
myStatusBar = "conky | dzen2 -x 1000 -y 0 -ta r -dock -e 'button3:'"

main = do
    dzenLeftBar  <- spawnPipe myXmonadBar
    dzenRightBar <- spawnPipe myStatusBar
    xmonad $ ewmh desktopConfig
        {
          logHook               = myLogHook dzenLeftBar >> fadeInactiveLogHook 0xdddddddd
        , layoutHook            = spacingRaw True (Border 5 5 5 5) False (Border 5 5 5 5) True $ smartBorders $ myLayout
        , manageHook            = namedScratchpadManageHook myScratchPads <+> myManageHook <+> manageDocks
        , terminal              = myTerminal
        , modMask               = myModMask
        , normalBorderColor     = myNormalBorderColor
        , focusedBorderColor    = myFocusedBorderColor
        }
        `additionalKeys`
        [
          ((myModMask, xK_p), spawn "rofi -show combi")
        , ((myModMask, xK_semicolon), namedScratchpadAction myScratchPads "terminal")
        , ((myModMask, xK_o), toggleWS)
        , ((myModMask, xK_w), screenWorkspace 0 >>= flip whenJust (windows . W.view) >> updatePointer (0.95, 0.05) (0, 0))
        , ((myModMask, xK_e), screenWorkspace 1 >>= flip whenJust (windows . W.view) >> updatePointer (0.95, 0.05) (0, 0))
        , ((myModMask, xK_r), screenWorkspace 2 >>= flip whenJust (windows . W.view) >> updatePointer (0.95, 0.05) (0, 0))
        , ((myModMask, xK_Left), moveTo Prev NonEmptyWS)
        , ((myModMask, xK_Right), moveTo Next NonEmptyWS)
        , ((myModMask .|. shiftMask, xK_Left), shiftToPrev >> prevWS)
        , ((myModMask .|. shiftMask, xK_Right), shiftToNext >> nextWS)
        , ((myModMask, xK_Down), withFocused (keysResizeWindow (-500, -500) (0.5, 0.5)))
        ]

myLayout = avoidStruts (tiled ||| Mirror tiled ||| Full) ||| Full
    where
        tiled = Tall nmaster delta ratio
        nmaster = 1
        delta = 1/100
        ratio = 1/2

myLogHook :: Handle -> X ()
myLogHook h = dynamicLogWithPP $ def
    {
      ppCurrent = dzenColor "#f9a825" "" . pad
    , ppHidden  = dzenColor "#ffffff" "" . pad
    , ppUrgent  = dzenColor "#ff0000" "#ff0000" . pad
    , ppWsSep   = ""
    , ppSep     = "|"
    , ppLayout  = (>> "")
    , ppTitle   = (" " ++) . dzenColor "#f2f2f2" "" . shorten 64
    , ppOutput  = hPutStrLn h
    }

myManageHook = composeAll
    [
      className =? "qutebrowser" --> doShift "2"
    , className =? "R_x11" --> doFloat
    , className =? "matplotlib" --> doFloat
    , className =? "Display" --> doCenterFloat
    , title =? "pass" --> doCenterFloat
    ]

myScratchPads = [ NS "terminal" spawnTerm findTerm manageTerm
                ]
    where
    spawnTerm  = myTerminal ++  " --title scratchpad"
    findTerm   = title =? "scratchpad"
    manageTerm = customFloating $ W.RationalRect 0.125 0.125 0.75 0.75
