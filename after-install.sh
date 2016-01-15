#!/bin/bash
##########################
## Script After-install ##
##########################

# Confirmando se o script esta rodando como ROOT
if [[ $EUID -ne 0 ]]; then
   echo "O script precisa de acesso ROOT. Execute novamente com SUDO." 1>&2
   exit 100
fi

# menu inicial para seleção de programas para instalar
function menuPrincipal() {
   #echo "=========================="
   #echo "= Selecione os Programas ="
   #echo "=========================="
TITLE="After-Install"
BACKTITLE="After-Install by @thiagoroshi"
MSG="Selecione os software para serem instalados:"
OPTIONS=(
       1 "Option 1" 
       2 "Option 2" 
       2 "Option 3" 
       0 "Quit")
  #dialog --backtitle "$__backtitle" --cr-wrap --no-collapse --msgbox "$msg" 20 60 >/dev/tty
CHOICES=$( dialog --clear\
                  --stdout \
                  --backtitle "$BACKTITLE" \
                  --title "$TITLE" \
                  --menu "$MSG" \
                  0 0 0 \
                  "${OPTIONS[@]}")
clear
for CHOICE in $CHOICES
do
  case $CHOICE in
      1 ) echo "testando botoes";;
      2 ) echo "testando botoes";;
      3 ) echo "testando botoes";;
      0 ) echo "vlw";;
  esac
done
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
