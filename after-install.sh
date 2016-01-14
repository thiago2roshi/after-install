#!/bin/bash

echo "##########################"
echo "## Script After-install ##"
echo "##########################"

if [[ $EUID -ne 0 ]]; then
   echo "O script precisa de acesso ROOT. Execute novamente com SUDO." 1>&2
   exit 100
fi


echo ">> iniciando update de repositorios ..."
sudo apt-get update 
echo ">> repositorios atualizados"

read -p ">> deseja atualizar os repositorios? [Y/N]" confirm
        case $confirm in
                y|Y ) sudo apt-get upgrade -y;;
                n|N ) echo "okay... não vai sem upgrade ( ; _ ;)";;
                * ) echo "apenas 'Y, y, N, n' ";;
        esac
