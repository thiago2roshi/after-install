
#!/bin/bash
#
# simple bash script to re-install all the programmes after a fresh install
# for debian/ubuntu
#
# Wayno Guerrini v2.0
#
# www.old.pkill-9.com

# quit does any processing before returning back from the script.
# here we are just exiting.
#
quit() {
# install software for encrypted dvd's (from libdvdread4)
sudo -n sh /usr/share/doc/libdvdread4/install-css.sh
exit
}

doit() {

#echo back to the terminal what we are trying to install
#

printf '\n'
echo 'installing: ' $1 $2
printf '\n'
sudo apt-get -y install $1

# $? is the return code from the previous command in this case the
# apt-get

retval=$?

# check the return code from the apt-get if it's okay, continue on,
# if it's not zero, tell me the return code, but continue on

if [ $retval -ne 0 ] ; then
echo '>>>>>failed rc =' $retval
fi

}
#
#
# okay re-install all the programmes after a fresh install -- note,
# if you don't want it, comment it out with a # in front
#

doit abiword 'the abiword wordprecessor'
#doit akregator 'the akregator rss reader KDE'
# doit amarok 'the amrok mp3 player for KDE'
# doit autofs 'the automount software'
#doit bibletime 'the bible time software'
#doit boinc 'the seti @ home software'
doit default-jre 'the default java runtime'
doit filezilla 'the filezilla ftp client'
doit linux-firmware-nonfree 'firm ware'
doit flashplugin-nonfree 'the flash browser plugin'
#doit gapcmon 'the graphical ups monitor apc'
doit gimp 'the photo/image processing'
#doit googleearth-package 'the google earth'
#doit gparted 'gui partioning programme'
doit grsync 'the graphical rsync'
doit guayadeque 'the guayadeque music player'
doit hplip-gui 'the hp printer gui'
doit ia32-libs 'the 32 bit share libraries/skype'
doit ia32-libs-gtk 'the 32 bit shared libs for gtk/skype'
doit icedtea-7-plugin 'the java browser plugin'
#doit k3b 'the k3b cd/dvd burning sftw KDE'
#doit kontact 'the appt appt calendar KDE'
doit libdvdread4 'read dvd software unencrypted'
doit libreoffice-core 'core of libreoffice'
doit libreoffice-calc 'libreoffice calc'
doit libreoffice-draw 'libreoffice draw'
doit libreoffice-help-en-us 'libreoffice help us english'
doit libreoffice-impress 'libreoffice power point stuff'
doit libreoffice-math 'libreoffice math'
doit libreoffice-writer 'libreoffice writer'
doit libindicator3-7 'needed for google chrome'
doit libindicator7 'needed for google chrome'
doit locate 'the file locater service'
doit mcrypt 'the mcrypt simple encryption'
doit mencoder 'the codecs transcoder'
doit mesa-utils 'the mesa utils -- glxgears'
doit nmap 'the network / port scanner tool'
doit ntpdate 'the network time protocol'
doit nullidentd 'the dumb ident (port 113) server4 irc'
doit openssh-server 'the secure shell server'
#doit pidgin-facebookchat 'the fb/pidgin interface'
doit pidgin 'the pidgin instant msg client'
doit sysv-rc-conf 'the boot up time configuration'
#doit rwho 'rwho/ruptime client'
doit screen 'the screen programme'
doit thunderbird 'the thunderbird email client'
doit traceroute 'the traceroute command'
#doit ttf-takao-mincho 'the japanese char set'
doit xubuntu-restricted-extras 'the ubutnu specific extra codecs for mp3s'
doit ufw 'the unix firewall'
doit vinagre 'the remote viewer client'
doit vlc 'the vlc media player'
#doit vsftpd 'the very secure ftp server'
doit wine 'the windows emulator programme'
doit x11vnc 'x11 remote desktop server'
#doit xinetd 'the extended internet daemon'
doit xsane 'the scanner programme'
doit xscreensaver 'the x screensaver for xwindows'
# and we are done!
quit