import Xmobar

config :: Config
config =
  defaultConfig
    {
      overrideRedirect = False,
      position = TopW L 100,
      font = "xft:Sans Mono-9",
      allDesktops = True,
      alpha = 200,
      commands =
        [ Run XMonadLog,
          Run $ Weather "KIND" [
            "--template", "<weather> <tempF>°F",
            "-L", "32",
            "-H", "70",
            "--low", "lightblue",
            "--normal", "#f8f8f2",
            "--high", "red"
          ] 3600,
          Run $ TopProc [] 25,
          Run $ Uptime [
            "--template", "Up: <days>d <hours>h <minutes>m <seconds>s"
          ] 10,
          Run $ MultiCpu [
            "-L", "3",
            "-H", "50",
            "--high", "red",
            "--normal", "green"
          ] 10,
          Run $ Memory ["--template", "Mem: <usedratio>%"] 10,
          Run $ Swap [] 10,
          Run $ Date "%a %Y-%m-%d <fc=#8be9fd>%H:%M:%S</fc>" "date" 10
        ],
      template = "%XMonadLog% }{ %top% | %multicpu% | %memory% * %swap% | %KIND% | %uptime% | %date%",
      alignSep = "}{",
      sepChar = "%"
    }

main :: IO ()
main = xmobar config

