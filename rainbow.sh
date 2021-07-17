# AMS Rainbow terminal thingo
# Run bash function between commands: https://askubuntu.com/questions/853102/how-do-i-run-a-command-before-or-after-every-command-written-in-the-console
#IMPORTANT. I suggest you copy PS1 and put it here or somewhere for safe keeping. It's not going to damage anything but good to keep it
INDEX=0
export RAINBOW_ENABLED=false
export ORIGINAL_PS1=$PS1
function rnbw(){
    if [ "$RAINBOW_ENABLED" = false ]; then
        RAINBOW_ENABLED=true
        update_terminal_colour
        echo "Turning on rainbow mode"
    else
        RAINBOW_ENABLED=false
        PS1=$ORIGINAL_PS1
        # Uncomment below if you want the rainbow to start from red every time, otherwise it starts from the colour you had rainbow mode in last.
        # let INDEX=0
        # This final escape character lets the terminal return to normal
        echo -en "\e[0m"
        echo "Turning off rainbow mode"
    fi
}
​
​
# Colours and formatting reference: https://misc.flogisoft.com/bash/tip_colors_and_formatting
# These colours are specific for the method used. I've tried this on the mac terminal and iterm2 and it doesn't work :(
declare -a COLOURS=("196" "160" "166" "202" "208" "214" "220" "178" "226" "11" "185" "190" "148" "154" "118" "46" "35" "36" "38" "39" "27" "26" "21" "57" "55" "129" "126" "161" "125")
COLOUR_LENGTH=${#COLOURS[@]}
function update_terminal_colour(){
    PS1='\e[38;5;${COLOURS[INDEX % COLOUR_LENGTH]}m[\u@\h \W]\$ '
    let INDEX++
}
# will run before any command is executed.
function PreCommand() {
  if [ -z "$AT_PROMPT" ]; then
    return
  fi
  unset AT_PROMPT
  if [ "$RAINBOW_ENABLED" = true ]; then
    update_terminal_colour
  fi
}
# This will run after the execution of the previous full command line.  We don't
# want PostCommand to execute when first starting a bash terminal
FIRST_PROMPT=1
function PostCommand() {
  AT_PROMPT=1
  if [ -n "$FIRST_PROMPT" ]; then
    unset FIRST_PROMPT
    return
  fi
}
# trap allows functions to be called when certain condition is met
trap "PreCommand" DEBUG
#Prompt command runs
# Command to run before printing PS1
PROMPT_COMMAND="PostCommand"
