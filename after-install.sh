#!/bin/bash

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="After-Install by @thiagoroshi"
#echo "##########################"
#echo "## Script After-install ##"
#echo "##########################"

# Confirmando se o script esta rodando como ROOT
if [[ $EUID -ne 0 ]]; then
   echo "O script precisa de acesso ROOT. Execute novamente com SUDO." 1>&2
   exit 100
fi

# menu inicial para seleção de programas para instalar
function menuPrincipal {
   #echo "=========================="
   #echo "= Selecione os Programas ="
   #echo "=========================="
   
   title="After-Install"   
   MENU="Selecione os software para serem instalados:"
   OPTIONS=(
      1 "Essencial" 
      2 "Terminal Guy" 
      3 "Media Player" 
      0 "Quit")
      
   CHOICE=$(dialog --clear \
                   --backtitle="$BACKTITLE" \
                   --title="$TITLE" \
                   --menu="$MENU"
                   $HEIGHT $WIDTH $CHOICE_WEIDTH \
                   "${OPTIONS[@]" \
                   2>&1 > /dev/tty)
   clear

   case
      1 ) 
      2 )
      3 )
      0 ) break;;
      * ) echo "Opção invalida, tente denovo...";continue;;
   esac
}

echo ">> iniciando update de repositorios ..."
apt-get update 
echo ">> repositorios atualizados"

read -p ">> deseja atualizar os repositorios? [y/N]" confirm
   case $confirm in
      y|Y ) apt-get upgrade -y;;
      n|N ) echo "okay... então vai sem upgrade ( ; _ ;)";;
      * ) echo "apenas 'Y, y, N, n' ";;
   esac

principal()
