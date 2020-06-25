import System.IO
import XMonad
import XMonad.Actions.CycleWS
import XMonad.Actions.FloatKeys
import XMonad.Actions.Minimize
import XMonad.Actions.UpdatePointer
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Minimize
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run(spawnPipe)
import qualified XMonad.StackSet as W

myTerminal              = "alacritty"
myModMask               = mod4Mask
myNormalBorderColor     = "#969694"
myFocusedBorderColor    = "#77b2f6"

myXmonadBar = "dzen2 -x 120 -y 0 -ta l -dock -e 'button3:'"

main = do
    dzenBar  <- spawnPipe myXmonadBar
    xmonad $ ewmh desktopConfig
        {
          logHook               = myLogHook dzenBar >> fadeInactiveLogHook 0xdddddddd
        , layoutHook            = spacingRaw True (Border 5 5 5 5) False (Border 5 5 5 5) True $ smartBorders $ minimize $ myLayout
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
        , ((myModMask, xK_Down), withFocused (keysResizeWindow (-500, -100) (0.5, 0.5)))
        , ((myModMask, xK_m), withFocused minimizeWindow)
        , ((myModMask .|. shiftMask, xK_m), withLastMinimized maximizeWindowAndFocus)
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
    , ppTitle   = (" " ++) . dzenColor "#f2f2f2" ""
    , ppOutput  = hPutStrLn h
    }

myManageHook = composeAll
    [
      className =? "qutebrowser" --> doShift "2"
    , className =? "R_x11" --> doFloat
    , className =? "matplotlib" --> doFloat
    , className =? "Display" --> doCenterFloat
    ]

myScratchPads = [ NS "terminal" spawnTerm findTerm manageTerm
                ]
    where
    spawnTerm  = myTerminal ++  " --title scratchpad"
    findTerm   = title =? "scratchpad"
    manageTerm = customFloating $ W.RationalRect 0.125 0.05 0.7 0.9
