#!/bin/bash
# start functions
function install_centos() {
    echo "==============================================="
    echo "Устанавливаем на CentOS 7 Linux."
    echo "==============================================="
# Load Start
cmd=(dialog --keep-tite --menu "Что будем делать?" 22 76 16)
options=(1 "Ставим Wine"
         2 "Настраиваем .NET (основные компоненты)"
         3 "Ставим .NET 4.8 (F3RAP, склад)"
		 4 "Настраиваем сеть")
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
for choice in $choices
do
    case $choice in
        1)
            sudo yum update -y && sudo yum groupinstall 'Development Tools' -y && sudo yum -y install epel-release && sudo yum config-manager --set-enabled powertools && sudo yum -y install libxslt-devel libpng-devel libX11-devel zlib-devel libtiff-devel freetype-devel libxcb-devel  libxml2-devel libgcrypt-devel dbus-devel libjpeg-turbo-devel  fontconfig-devel gnutls-devel gstreamer1-devel libXcursor-devel libXi-devel libXrandr-devel libXfixes-devel libXinerama-devel libXcomposite-devel mesa-libOSMesa-devel libpcap-devel libusb-devel libv4l-devel libgphoto2-devel gstreamer1-devel libgudev SDL2-devel gsm-devel libvkd3d-devel libudev-devel && sudo yum -y install wget && sudo yum install wine winbind xorg-dev libx11-dev -y;
			break;
            ;;
        2)
            WINEARCH=win32 WINEPREFIX='/home/'$(whoami)'/.wine' winecfg && wineboot -u && winetricks winhttp msxml3 msxml4 corefonts lucida tahoma vb6run mdac28 mfc42 jet40 native_oleaut32 && winetricks --force dotnet472;
			break;
            ;;
        3)
			wine $PWD/f3tail-distrib/dist/dotnet48/ndp48-x86-x64-allos-enu.exe;
			break;
            ;;
        4)
            sudo setcap cap_net_raw+epi "$(readlink -f "/usr/bin/wine-preloader")"
			break;
            ;;
    esac
done
}

function install_ubuntu() {
echo "==============================================="
echo "Устанавливаем на Ubuntu"
echo "==============================================="
# Load Start
cmd=(dialog --keep-tite --menu "Что будем делать?" 22 76 16)
options=(1 "Ставим Wine"
         2 "Настраиваем .NET (основные компоненты)"
         3 "Ставим .NET 4.8 (F3RAP, склад)"
		 4 "Настраиваем сеть")
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
for choice in $choices
do
    case $choice in
        1)
            sudo dpkg --add-architecture i386 && sudo apt-get update && sudo mkdir -pm755 /etc/apt/keyrings && sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key; sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources && sudo apt-get update && sudo apt install wine winetricks winbind xorg-dev libx11-dev -y;
			break;
            ;;
        2)
            sudo apt-get install winetricks -y && sudo rm -Rf ~/.wine && winecfg WINEARCH=win32 WINEPREFIX='/home/'$(whoami)'/.wine' && wineboot -u && winetricks winhttp msxml3 msxml4 dotnet40 corefonts lucida tahoma vb6run mdac28 mfc42 jet40 native_oleaut32 && winetricks --force dotnet472;
			break;
            ;;
        3)
			wine $PWD/f3tail-distrib/dist/dotnet48/ndp48-x86-x64-allos-enu.exe;
			break;
            ;;
        4)
            sudo setcap cap_net_raw+epi "$(readlink -f "/usr/bin/wine-preloader")"
			break;
            ;;
    esac
done
}

function install_mint() {
echo "==============================================="
echo "Устанавливаем на Mint"
echo "==============================================="
# Load Start
cmd=(dialog --keep-tite --menu "Что будем делать?" 22 76 16)
options=(1 "Ставим Wine"
         2 "Настраиваем .NET (основные компоненты)"
         3 "Ставим .NET 4.8 (F3RAP, склад)"
		 4 "Настраиваем сеть")
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
for choice in $choices
do
    case $choice in
        1)
            sudo dpkg --add-architecture i386 && sudo apt-get update && sudo mkdir -pm755 /etc/apt/keyrings && sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key; sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources && sudo apt-get update && sudo apt install wine wine winetricks winbind xorg-dev libx11-dev -y;
			break;
            ;;
        2)
            sudo apt-get install winetricks -y && sudo rm -Rf ~/.wine && winecfg WINEARCH=win32 WINEPREFIX='/home/'$(whoami)'/.wine' && wineboot -u && winetricks winhttp msxml3 msxml4 dotnet40 corefonts lucida tahoma vb6run mdac28 mfc42 jet40 native_oleaut32 && winetricks --force dotnet472;
            ;;
        3)
			wine $PWD/f3tail-distrib/dist/dotnet48/ndp48-x86-x64-allos-enu.exe;
			break;
            ;;
        4)
            sudo setcap cap_net_raw+epi "$(readlink -f "/usr/bin/wine-preloader")"
			break;
            ;;
    esac
done
}
function install_astra() {
echo "==============================================="
echo "Устанавливаем на Astra Linux"
echo "==============================================="
# Load Start
cmd=(dialog --keep-tite --menu "Что будем делать?" 22 76 16)
options=(1 "Ставим Wine"
         2 "Настраиваем .NET (основные компоненты)"
         3 "Ставим .NET 4.8 (F3RAP, склад)"
		 4 "Настраиваем сеть")
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
for choice in $choices
do
    case $choice in
        1)
             sudo dpkg --add-architecture i386 && sudo mkdir -pm755 /etc/apt/keyrings && mkdir -pm755 /usr/share/keyrings && sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key; sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bullseye/winehq-bullseye.sources && sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys `sudo apt-get update 2>&1 | grep -o '[0-9A-Z]{16}$' | xargs` && sudo apt-get update && sudo apt-get install wine-staging winetricks winbind xorg-dev libx11-dev -y;
			break;
            ;;
        2)
            rm -Rf ~/.wine && WINEARCH=win32 WINEPREFIX='/home/'$(whoami)'/.wine' winecfg && wineboot -u && winetricks winhttp msxml3 msxml4 corefonts lucida tahoma vb6run mdac28 mfc42 jet40 native_oleaut32 && winetricks --force dotnet472;
			break;
            ;;
        3)
			wine $PWD/f3tail-distrib/dist/dotnet48/ndp48-x86-x64-allos-enu.exe;
			break;
            ;;
        4)
            sudo setcap cap_net_raw+epi "$(readlink -f "/usr/bin/wine-preloader")"
			break;
            ;;
    esac
done
}

function install_debian() {
echo "==============================================="
echo "Устанавливаем на Debian"
echo "==============================================="
# Load Start
cmd=(dialog --keep-tite --menu "Что будем делать?" 22 76 16)
options=(1 "Ставим Wine"
         2 "Настраиваем .NET (основные компоненты)"
         3 "Ставим .NET 4.8 (F3RAP, склад)"
		 4 "Настраиваем сеть")
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
for choice in $choices
do
    case $choice in
        1)
            sudo dpkg --add-architecture i386 && sudo apt-get update && sudo mkdir -pm755 /etc/apt/keyrings && sudo wget -nc https://dl.winehq.org/wine-builds/winehq.key && sudo apt-key add winehq.key && sudo sh -c 'echo " deb https://dl.winehq.org/wine-builds/debian/ bullseye main" >> /etc/apt/sources.list.d/wine.list' && sudo apt install wine winetricks winbind xorg-dev libx11-dev -y;
			break;
            ;;
        2)
            sudo rm -Rf ~/.wine && WINEARCH=win32 WINEPREFIX='/home/'$(whoami)'/.wine' winecfg && wineboot -u && winetricks winhttp msxml3 msxml4 dotnet40 corefonts lucida tahoma vb6run mdac28 mfc42 jet40 native_oleaut32 && winetricks --force dotnet472;
			break;
            ;;
        3)
			wine $PWD/f3tail-distrib/dist/dotnet48/ndp48-x86-x64-allos-enu.exe;
			break;
            ;;
        4)
            sudo setcap cap_net_raw+epi /opt/wine-staging/bin/wine-preloader
			break;
            ;;
    esac
done
}

function install_redos() {
echo "==============================================="
echo "Устанавливаем на RED OS"
echo "==============================================="
# Load Start
cmd=(dialog --keep-tite --menu "Что будем делать?" 22 76 16)
options=(1 "Ставим Wine"
         2 "Настраиваем .NET (основные компоненты)"
         3 "Ставим .NET 4.8 (F3RAP, склад)"
		 4 "Настраиваем сеть")
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
for choice in $choices
do
    case $choice in
        1)
            sudo yum update -y && sudo yum -y install wget && sudo yum install wine winetricks dotnet-* -y;
			break;
            ;;
        2)
            WINEARCH=win32 WINEPREFIX='/home/'$(whoami)'/.wine' winecfg && winetricks winhttp msxml3 msxml4 corefonts lucida tahoma vb6run mdac28 mfc42 jet40 native_oleaut32 && winetricks --force dotnet472;
			break;
            ;;
        3)
			wine $PWD/f3tail-distrib/dist/dotnet48/ndp48-x86-x64-allos-enu.exe;
			break;
            ;;
        4)
            sudo setcap cap_net_raw+epi "$(readlink -f "/usr/bin/wine-preloader")"
			break;
            ;;
    esac
done
}

function install_driver() {

if cat /etc/*release | grep ^NAME | grep Debian > /dev/null | grep Ubuntu > /dev/null | grep Astra > /dev/null | grep Mint > /dev/null; then
echo "Ставлю драйвера ФН и ККМ АТОЛ"
cd $HOME/f3tail-distrib/10.9.4.0/installer/deb &
dpkg -i libfptr10_10.9.4.0_amd64.deb &
dpkg -i libfptr10-gui_10.9.4.0_amd64.deb &
dpkg -i fptr10-rpc-server_10.9.4.0_amd64.deb &
dpkg -i fptr10-test-util_10.9.4.0_amd64.deb &
dpkg -i fptr10-web-server_10.9.4.0_amd64.deb &
fi

if cat /etc/*release | grep ^NAME | grep CentOS > /dev/null || cat /etc/*release | grep ^ID | grep redos > /dev/null; then
echo "Ставлю драйвера ФН и ККМ АТОЛ"
cd $HOME/f3tail-distrib/10.9.4.0/installer/rpm &
yum install libfptr10-10.9.4.0-1.x86_64.rpm libfptr10-gui-10.9.4.0-1.x86_64.rpm fptr10-test-util-10.9.4.0-1.x86_64.rpm -y &
fi

{
        i="0"
        while (true)
        do
            proc=$(ps aux | grep -v grep | grep -e "dpkg") || proc=$(ps aux | grep -v grep | grep -e "yum")
            if [[ "$proc" == "" ]]; then break; fi
            sleep 1
            echo $i
            i=$(expr $i + 1)
        done
        echo 100
        sleep 2
        exit 1
} | whiptail --title "Драйверы АТОЛ" --gauge "Установка драйверов АТОЛ... Пожалуйста, подождите." 8 78 0
}
# end functions

cmd=(dialog --keep-tite --menu "Выберите тип установки:" 22 76 16)
options=(1 "Установить F3TAIL на CentOS 7"
         2 "Установить F3TAIL на Ubuntu"
         3 "Установить F3TAIL на Mint"
		 4 "Установить F3TAIL на Astra Linux"
		 5 "Установить F3TAIL на Debian 9"
		 6 "Установить F3TAIL на RED OS"
		 7 "Установить драйвера АТОЛ")
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
for choice in $choices
do
    case $choice in
        1)
	install_centos
        ;;
        2)
	install_ubuntu
        ;;
        3)
	install_mint
        ;;
        4)
	install_astra
        ;;
        5)
	install_debian
        ;;
		6)
	install_redos
		;;
		7)
    install_driver
        ;;
    esac
done
