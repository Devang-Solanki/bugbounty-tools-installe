# bugbounty-tools-installer
A bash script that will install required tools and wordlist neccesary for bug bounty usefull for those who does distro hopping alot like me.

## Usage

```
git clone https://github.com/Devang-Solanki/bugbounty-tools-installer.git
cd bugbounty-tools-installer
chmod +x bugbounty-tools-installer.sh
./bugbounty-tools-installer.sh
```

## Tools Included in this Script
[Nmap](https://nmap.org/)  [Nikto](https://github.com/projectdiscovery/naabu)  [Nuclei](https://github.com/projectdiscovery/nuclei) [sqlmap](https://github.com/sqlmapproject/sqlmap) [Arjun](https://github.com/s0md3v/Arjun) [kxss](https://github.com/Emoe/kxss) [httpx](https://github.com/projectdiscovery/httpx) [waybackulrs](https://github.com/tomnomnom/waybackurls) [Gauplus](https://github.com/bp0lr/gauplus) [Sublist3r](https://github.com/aboul3la/Sublist3r) [Assetfinder](https://github.com/tomnomnom/assetfinder) [Amass](https://github.com/OWASP/Amass) [Dirsearch](https://github.com/maurosoria/dirsearch) [Nabbu](https://github.com/projectdiscovery/naabu)

## Some Usefull Oneliners
### Subdomain Enumeration
```bash
curl -s "https://crt.sh/?q=<domain>" | grep "<TD>" | grep $url | cut -d ">" -f2 | cut -d "<" -f1 | sort -u | sed '/^*/d' > subdomain
curl -s "https://riddler.io/search/exportcsv?q=pld:<domain>" | grep -Po "(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | sort -u > subdomain
curl -s "https://jldc.me/anubis/subdomains/<domain>" | grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | cut -d "/" -f3 > subdomain
curl -s "https://rapiddns.io/subdomain/<domain>?full=1#result" | grep "<td><a" | cut -d '"' -f 2 | grep http | cut -d '/' -f3 | sed 's/#results//g' | sort -u > subdomain
curl -s "https://dns.bufferover.run/dns?q=<domain>" |jq -r .FDNS_A[]|cut -d',' -f2| sort -u > subddomain
curl -s "http://web.archive.org/cdx/search/cdx?url=*.domain.com/*&output=text&fl=original&collapse=urlkey" | sed -e 's_https*://__' -e "s/\/.*//" | sort -u > subdomain
```
### Find Endpoints From a JS File
```bash
cat <js_file> | grep -oh "\"\/[a-zA-Z0-9_/?=&]*\"" | sed -e 's/^"//' -e 's/"$//' | sort -u
```

### Dump In Scope Domain From `chaos.projectdiscovery.io`
```bash
wget "https://chaos-data.projectdiscovery.io/<domain name>.zip" -o /tmp/<domain name>.zip && unzip /tmp/*.zip && mv /tmp/.*txt . 
```
