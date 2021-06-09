query=$1

function controlOnly() {
    defaults write com.apple.touchbar.agent PresentationModeGlobal -string fullControlStrip;
    pkill "Touch Bar agent";
    killall "ControlStrip";
}

function fnOnly() {
    defaults write com.apple.touchbar.agent PresentationModeGlobal -string functionKeys;    pkill "Touch Bar agent";
    killall "ControlStrip";
}

function appOnly() {
    defaults write com.apple.touchbar.agent PresentationModeGlobal -string app;
    pkill "Touch Bar agent";
    killall "ControlStrip";
}

function appWithControl() {
    defaults write com.apple.touchbar.agent PresentationModeGlobal -string appWithControlStrip; pkill "Touch Bar agent";
    killall "ControlStrip";
}

{
    if [ "$1" == "control" ]; then
        controlOnly
    elif [ "$1" == "function" ]; then
        fnOnly
    elif [ "$1" == "apponly" ]; then
        appOnly
    elif [ "$1" == "appcontrol" ]; then
        appWithControl
    else
        printf "\\nUsage:\\n\\tTouchBar control\\n\\tTouchBar function\\n\\tTouchBar app\\n\\n"
    fi
}
