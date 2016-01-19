#!/bin/bash

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
   dialog              \
      --stdout         \
      --title "$TITLE" \
      --checklist $MSG 0 0 0 \
      git "temos que versionar" off \
        zsh "afinal para que o Bash" off \
        mpd "Servidor de Musicas - Terminal"+ off
      
      
}
function dialogMenu()
{
    TITLE=$1
    MSG=$2
    OPT=$3

    dialog              \
       --stdout         \
       --title "$TITLE" \
       --menu "$MSG"    \
       0 0 0            \
       ${OPT[@]}
}