#!/bin/zsh
#
# simple bash script to re-install all the programmes after a fresh install
# for debian/ubuntu
#
# Tranks: Wayno Guerrini v2.0 - www.old.pkill-9.com
#         mcobit - RetrOsmc 
##
# Importando helpers
PWD=$(pwd)
source $PWD/source/helpers.sh
source $PWD/source/appPerfil.sh

function justDoIt()
{   
   if [[ $EUID -ne 0 ]]; then
      dialogMSG  \
         "Opa, temos um erro" \
         "O script precisa de acesso ROOT. Execute novamente com SUDO."
      clear
      exit 100
   fi
   
   dialogMSG \
         "Pos Instalacao de ambiente Ubuntu" \
            "Let's GO"
}
# Atualizando repositorios e aplicacoes
#       antes de comecar a instalar
function updateSystem()
{
   TITLE="Pre-Instalação"
   ##
   # apt update
   dialogMSG  \
       $TITLE \
      "primeiro, atualizar repositorios "
   # adicionado o "&" para o SPINNER
   apt-get update 2>&1 & |\
        spinner $!
        | dialogInfo \
              $TITLE \
               "Atualizando repositorios..."
   
   dialogMSG  \
       $TITLE \
      "Repositorios Atualizados"
   ##
   # apt Upgrade
   dialogYN  \
      "deseja atualizar os pacotes do sistema?"
      
   if [[ $? = 0 ]]; then
      apt-get upgrade -y \
         --show-progress \
         2>&1 |          \
         grep                      \
            --line-buffered         \
            -oP "(\d+(\.\d+)?(?=%))" \
         | dialogGauge           \
            "Atualizando Pacotes" \
            "Atualizando ..."
   else
      dialogMSG \
         $TITLE \
         "okay... então vai sem upgrade ( ; _ ;)"
   fi
}
## Iniciando as instalacoes
#   Bora comecar a festa
function install()
{
   PCT=$1
   DESC=$2
   printf '\n ======================================= \n'
   # Dando retorno do pacote a ser instalado
   echo 'instalando: ' $PCT $DESC
   printf '\n'
   apt-get install -y $PCT
   #
   # $? is the return code from the previous command in this case the
   # apt-get
   retval=$?
   # check the return code from the apt-get if it's okay, continue on,
   # if it's not zero, tell me the return code, but continue on
   #
   if [ $retval -ne 0 ] ; then
   echo '>>>>>failed rc =' $retval
   fi
}
# 
#========================
# Agora começa a Bagaça
#========================
justDoIt
updateSystem

#while :
 #   do
    #menuPrincipal
    #dialogMenu-perfil
    CMD=(dialog --stdout --title "$TITLE" --checklist "$MSG" 0 0 0) 
    OPT=(git "temos que versionar" off
         zsh "afinal para que o Bash"  off
         mpd "Servidor de Musicas - Terminal"  off
         ncmpcpp "Music Player de Terminal - MPD"  off
         mpv "player de terminal - porque será?"  off)
    DIAL=$("${CMD[@]}" "${OPT[@]}" 2>&1 >/dev/tty)
    clear
  #  exit 0
#done