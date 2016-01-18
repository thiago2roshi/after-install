#!/bin/bash
#
# simple bash script to re-install all the programmes after a fresh install
# for debian/ubuntu
#
# Tranks: Wayno Guerrini v2.0 - www.old.pkill-9.com
#
# 

function dialogMSG()
{
   TITLE=$1
   MSG=$2

   dialog               \
      --clear           \
      --title "$TITLE"  \
      --msgbox "$MSG"   \
      0 0
   clear
}
function dialogYN()
{
   MSG=$1
   
   dialog            \
      --clear        \
      --yesno "$MSG" \
      0 0
   clear
}
function dialogSelect()
{
   TITLE=$1
   MSG=$2

   dialog                 \
      --clear             \
      --title $TITLE      \
      --yesno  $MSG"\n\n" \
      0 0
   clear
}
function justDoIt()
{   
   if [[ $EUID -ne 0 ]]; then
      dialogMSG               \
         "Opa, temos um erro" \
         "O script precisa de acesso ROOT. Execute novamente com SUDO."
      exit 100
   fi
   
   dialogMSG                              \
      "Pos Instalacao de ambiente Ubuntu" \
      "Let's GO"
}

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
# Atualizando repositorios e aplicacoes
#       antes de comecar a instalar
function updateSystem()
{
   TITLE="Pre-Instalação"
   dialogMSG  \
       $TITLE \
      "Iniciando update de repositorios ..."
   echo "=================================="
   printf '\n'
      apt-get update 
   
   dialogMSG  \
       $TITLE \
      "Repositorios Atualizados"
   
   dialogYN  \
      "deseja atualizar os repositorios?"
      
   if [[ $? = 0 ]]; then
      echo "=================================="
      printf '\n'
         apt-get upgrade -y   
   else
      dialogMSG \
         $TITLE \
         "okay... então vai sem upgrade ( ; _ ;)"
   fi
}
#========================
# Agora começa a Bagaça
#========================
justDoIt
updateSystem
