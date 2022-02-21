RED="\e[31m"
GREEN="\e[32m"
YELLOW="\033[0;33m"
ENDCOLOR="\e[0m"

ARCH="sudo pacman --noconfirm -S"
DEBIAN="sudo apt install -y"

echo "#################################################################################################"
echo "${RED}     ┌┐ ┬ ┬┌─┐┌┐ ┌─┐┬ ┬┌┐┌┌┬┐┬ ┬  ┌┬┐┌─┐┌─┐┬  ┌─┐  ┬┌┐┌┌─┐┌┬┐┌─┐┬  ┬  ┌─┐┬─┐   ${ENDCOLOR} "
echo "${RED}     ├┴┐│ ││ ┬├┴┐│ ││ ││││ │ └┬┘   │ │ ││ ││  └─┐  ││││└─┐ │ ├─┤│  │  ├┤ ├┬┘   ${ENDCOLOR} "
echo "${RED}     └─┘└─┘└─┘└─┘└─┘└─┘┘└┘ ┴  ┴    ┴ └─┘└─┘┴─┘└─┘  ┴┘└┘└─┘ ┴ ┴ ┴┴─┘┴─┘└─┘┴└─   ${ENDCOLOR} "
echo "#################################################################################################"

if which pacman 2> /dev/null
then
	echo "It seems your machine is based on Arch
	"
	echo "Updating Packages List"
	sudo pacman --noconfirm -Syy
	DISTRO=$ARCH 
	${DISTRO} python-pip
	${DISTRO} jq
	${DISTRO} python-setuptools
	${DISTRO} python-dnspython
	${DISTRO} git
	${DISTRO} nodejs
	${DISTRO} npm
	${DISTRO} libxml2
	${DISTRO} base-devel
	${DISTRO} libpcap 
	${DISTRO} go
	${DISTRO} docker
	${DISTRO} ruby
	${DISTRO} ldns
	${DISTRO} libffi
	${DISTRO} curl
fi

if which apt 2> /dev/null
then
	echo "It seems your machine is based on Debian"
	echo "Updating Packages List"
	DISTRO=$DEBIAN
	sudo apt update && sudo apt upgrade
	${DISTRO} golang
	${DISTRO} python-pip
	${DISTRO} jq
	${DISTRO} python-setuptools
	${DISTRO} python-dnspython
	${DISTRO} git
	${DISTRO} nodejs
	${DISTRO} npm
	${DISTRO} libxml2
	${DISTRO} docker.io
	${DISTRO} libcurl4-openssl-dev
	${DISTRO} libssl-dev
	${DISTRO} ruby-full
	${DISTRO} libldns-dev
	${DISTRO} libpcap-dev
	${DISTRO} build-essential libffi-dev python-dev
	${DISTRO} libcurl4-openssl-dev libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
fi

echo "{$GREEN}Installing nmap${ENDCOLOR}"
${DISTRO} nmap

echo "{$GREEN}Installing Nikto${ENDCOLOR}"
${DISTRO} nikto

mkdir ~/Tools/
mkdir ~/Wordlist/

echo "{$GREEN}Installing Nuclei${ENDCOLOR}"
cd ~/Tools/
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
ln ${HOME}/go/bin/nuclei /usr/local/bin/nuclei

echo "{$GREEN}Installing sqlmap${ENDCOLOR}"
cd ~/Tools/
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd sqlmap-dev
chmod +x sqlmap.py
ln ${HOME}/Tools/sqlmap-dev/sqlmap.py /usr/local/bin/sqlmap

echo "{$GREEN}Installing arjun${ENDCOLOR}"
cd ~/Tools/
pip3 install arjun

echo "{$GREEN}Installing kxss${ENDCOLOR}"
cd ~/Tools/
go install -v github.com/Emoe/kxss.git
ln ${HOME}/Tools/kxss/kxss /usr/local/bin/kxss

echo "{$GREEN}Installing Httpx${ENDCOLOR}"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
ln ${HOME}/go/bin/httpx /usr/local/bin/httpx

echo "{$GREEN}Installing Waybackurls${ENDCOLOR}"
cd ~/Tools/
go install -v github.com/tomnomnom/waybackurls@latest
ln ${HOME}/go/bin/waybackurls /usr/local/bin/waybackurls

echo "{$GREEN}Installing Gauplus${ENDCOLOR}"
cd ~/Tools/
go install -v github.com/bp0lr/gauplus@latest
ln ${HOME}/go/bin/gauplus /usr/local/bin/gauplus

echo "{$GREEN}Installing Sublist3r${ENDCOLOR}"
cd ~/Tools/
git clone https://github.com/aboul3la/Sublist3r.git
cd ~/Tools/Sublist3r
sudo pip install -r requirements.txt
ln ${HOME}/Tools/Sublist3r/sublist3r.py /usr/local/bin/sublist3r

echo "{$GREEN}Installing Subfinder${ENDCOLOR}"
cd ~/Tools/
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
ln ${HOME}/go/bin/subfinder /usr/local/bin/subfinder

echo "{$GREEN}Installing Assetfinder${ENDCOLOR}"
cd ~/Tools/
go install -v github.com/tomnomnom/assetfinder
ln ${HOME}/go/bin/assetfinder /usr/local/bin/assetfinder

echo "{$GREEN}Installing fuff${ENDCOLOR}"
cd ~/Tools/
go install -v github.com/ffuf/ffuf@latest
ln ${HOME}/Tools/fuff/fuff /usr/local/bin/fuff

echo "{$GREEN}Installing Amass${ENDCOLOR}"
cd ~/Tools/
go install -v github.com/OWASP/Amass/v3/...@master
ln ${HOME}/go/bin/amass /usr/local/bin/amass

echo "{$GREEN}Installing Dirsearch${ENDCOLOR}"
cd ~/Tools/
git clone https://github.com/maurosoria/dirsearch.git
cd dirsearch
pip3 install -r requirements.txt
ln ${HOME}/Tools/dirsearch/dirsearch.py /usr/local/bin/dirsearch

echo "{$GREEN}Getting Seclist Wordlist${ENDCOLOR}"
cd ~/Wordlist/
git clone https://github.com/danielmiessler/SecLists.git

echo "{$GREEN}Getting rockyou.txt Wordlist${ENDCOLOR}"
wget "https://gitlab.com/kalilinux/packages/wordlists/-/raw/kali/master/rockyou.txt.gz" -o /tmp/
gunzip -d /tmp/rockyou.txt.gz
mv /tmp/rockyou.txt ~/Wordlist/

echo "{$GREEN}Getting PayloadsAllTheThings Wordlist${ENDCOLOR}"
cd ~/Wordlist/
https://github.com/swisskyrepo/PayloadsAllTheThings.git

