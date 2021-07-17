In May I made a command line tool to turn my terminal into a rainbow. Each new
line will be a new colour of the rainbow, and then loop around.

It uses a trap function to set terminal escape characters in the `$PS1` variable
after each new line. Unfortunately, this approach only works for a specific collection of terminals.
I haven't figured out how to get something to work for iTerm2 yet.  

To include this on your command line, download the rainbow.sh script and add
`. <file_path>/rainbow.sh` to your ~/.bashrc file, or whichever file is sourced
when starting your terminal.

You can then turn on and off the rainbow text by typing `rnbw`.

![sample](./rainbow.png?raw=true "sample")
