import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Actions.Volume
import XMonad.Util.Dzen
import System.IO
import qualified XMonad.StackSet as S


 
{-
-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP {ppTitle = xmobarColor "green" "" . shorten 50
                        }
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

main = xmonad =<< statusBar "xmobar" myPP toggleStrutsKey defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        --, logHook = dynamicLogWithPP xmobarPP
                        --{ ppOutput = hPutStrLn xmproc
                        --, ppTitle = xmobarColor "green" "" . shorten 50
                        -- }
        -- , modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock; xset dpms force off")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        ]
-}

-- The main function.
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "orange" "" . wrap "<" ">" 
                , ppTitle = xmobarColor "orange" "" . shorten 50
                }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- alerts with dzen
alert = dzenConfig centered . show . round

centered = onCurr (center 150 66)
  >=> font "-*-helvetica-*-r-*-*-64-*-*-*-*-*-*-*"
  >=> addArgs ["-fg", "#80c0ff"]
  >=> addArgs ["-bg", "#000040"]

myExtraWorkspaces = [(xK_0, "0"),(xK_minus, "tmp"),(xK_equal, "swap")]


myWorkspaces :: [WorkspaceId]
myWorkspaces = (map show [1 .. 10 :: Int])  ++ (map snd myExtraWorkspaces)

-- Main configuration, override the defaults to your liking.
myConfig = defaultConfig
      { layoutHook = avoidStruts  $  layoutHook defaultConfig
      , workspaces = myWorkspaces
      , terminal   = "gnome-terminal"
      , borderWidth = 5
      , normalBorderColor = "Black"
      , focusedBorderColor = "Orange"
      --, terminal   = "terminator"
      } `additionalKeys`
      ([ ((mod1Mask, xK_F7), lowerVolume 3 >>= alert)
      , ((mod1Mask, xK_F8), raiseVolume 3 >>= alert)
      --, ((mod1Mask, xK_F6), toggleMute >>= alert)
      ] ++ [
        ((mod1Mask, key), (windows $ S.greedyView ws))
        | (key, ws) <- myExtraWorkspaces
      ] ++ [
        ((mod1Mask .|. shiftMask, key), (windows $ S.shift ws))
        | (key,ws) <- myExtraWorkspaces
      ])
