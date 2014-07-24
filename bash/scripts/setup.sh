#Dotfiles startup script

#Symlink the bashrc in this dir to ~/.bashrc
ln -s ~/dotfiles/bash/bashrc ~/.bashrc
#Symlink .sh_history, .bash_history, and .mysql_history to /dev/null
#This prevents passwords being written to these files (and other information you may not want there)
#It also still allows command scrollback for the current bash session
for i in $HOME/.sh_history $HOME/.bash_history $HOME/.mysql_history
do
    if [ -f $i ];
    then
        rm -f $i;
    fi
    ln -s /dev/null $i
done
