#!/bin/bash
## 
# tranks to Andrew Martin 
#        http://www.thetechrepo.com/main-articles/573.html
## USO
# /usr/bin/foo &
# PID=$!
# /usr/local/bin/spinner $PID &
# wait $PID
# echo "/usr/bin/foo's exit code was $?"
function spinner {
    PROC=$1
    while [ -d /proc/$PROC ];do
        echo -n '' ; sleep 0.05
        echo -n '' ; sleep 0.05
        echo -n '' ; sleep 0.05
        echo -n '' ; sleep 0.05
    done
    return 0
}
 
spinner $1
function dialogMSG()
{
    TITLE=$1
    MSG=$2

    dialog                \
        --title "$TITLE"  \
        --msgbox "$MSG"   \
        0 0
   clear
}
function dialogYN()
{
    MSG=$1

    dialog             \
        --yesno "$MSG" \
        0 0
}
function dialogInfo()
{
    TITLE=$1
    MSG=$2
    dialog \
    --title "$TITLE" \
    --infobox "$MSG" \
    11 70
}
function dialogGauge()
{
    TITLE=$1
    GAUGE=$2
    dialog \
    --title "$TITLE" \
    --gauge "$GAUGE" \
    11 70
}
function dialogChecklist()
{
   TITLE=$1
   MSG=$2
   OPT=$3
   dialog                \
      --stdout           \
      --title "$TITLE"   \
      --checklist "$MSG" \
      0 0 0              \
      $OPT
}
function dialogMenu()
{
    TITLE=$1
    MSG=$2
    OPT=($3)

    dialog              \
       --stdout         \
       --title "$TITLE" \
       --menu "$MSG"    \
       0 0 0            \
       ${OPT[@]}
}
function dialogMenu-perfil()
{
    TITLE=$1
    MSG=$2
    OPT=$3

    dialog              \
       --stdout         \
       --title "$TITLE" \
       --menu "$MSG"    \
       0 0 0            \
         minimal "apenas o necessario" \
         recomendada "alguns programas e repositorios interessantes" \
         ThiagoRoshi "danesse tudo e tomara que dê certo"
}
function dialogChecklist-extras()
{
   TITLE=$1
   MSG=$2
   OPT=$3
   dialog              \
      --stdout         \
      --title "$TITLE" \
      --checklist "$MSG" \
      0 0 0 \
        git "temos que versionar" off \
        zsh "afinal para que o Bash" off \
        mpd "Servidor de Musicas - Terminal" off \
        ncmpcpp "Music Player de Terminal - MPD" off \
        mpv "player de terminal - porque será?" off
}
###########dialogChecklist-extras
