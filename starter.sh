#FileX is written by Victor Ramussen (github = Revo1999)

green='\033[0;32m'
yellow = '\033[0;33m'



printf "${yellow}Installing Dialog \n"
sudo apt-get update
sudo apt-get install dialog
printf "${green}Dialog installed \n"



printf "${yellow}Loading Git Credentials \n"
bash YOUR_USERNAME/setup_script/git.sh
printf "${green}Git Credentials loaded \n"


printf "${yellow}\nfile explorer copying into bin\n"
sudo cp YOUR_USERNAME/setup_script/filex.sh /home/ucloud/.local/bin
sudo ln -s /home/ucloud/.local/bin/filex.sh /home/ucloud/.local/bin/filex
printf "${green}\nfile explorer created\n"

printf "${yellow}\nsetting file explorer style\n"
sudo cp YOUR_USERNAME/setup_script/.dialogrc /home/ucloud
printf "${green}\nfile explorer created\n"
