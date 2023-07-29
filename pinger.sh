#!/bin/bash

## Copyright ©UDPTeam

## Discord: https://discord.gg/civ3

## Script to keep-alive your DNSTT server domain record query from target resolver/local dns server

## Run this script excluded to your VPN tunnel (split vpn tunneling mode)

## run command: ./globe-uwu1.sh l



## Your DNSTT Nameserver & your Domain `A` Record

NS='nssshus1.blastvpn.store'
NS1='nssshus2.blastvpn.store'
NS2='nssshus3.blastvpn.store'
NS3='nssshgerman1.blastvpn.store'
NS4='nssshgerman2.blastvpn.store'
NS5='nssshgerman3.blastvpn.store'
NS6='nssshchina1.blastvpn.store'
NS7='nssshchina2.blastvpn.store'
NS8='nssshchina3.blastvpn.store'
NS9='nssshca1.blastvpn.store'
NS10='nssshca2.blastvpn.store'
NS11='nssshca3.blastvpn.store'
NS12='nssshsg1.blastvpn.store'
NS13='nssshsg2.blastvpn.store'
NS14='nssshsg3.blastvpn.store'
NS15='nsnewsg1.blastvpn.store'
NS16='nsnewsg2.blastvpn.store'
NS17='nsnewsg3.blastvpn.store'
NS18='nsnewsg4.blastvpn.store'
NS19='nsnewsg5.blastvpn.store'
NS20='nsnewsg6.blastvpn.store'
NS21='nsnewsg7.blastvpn.store'
NS22='nsnewsg8.blastvpn.store'
NS23='nsnewsg9.blastvpn.store'
NS24='nsnewsg10.blastvpn.store'
NS25='dns2.xquic.site'
NS26='ns.pinaybeatriz.ml'
NS27='3ns.jimfree.net'
NS28='5ns.jimfree.net'
NS29='6ns.jimfree.net'
A='nssshus1.blastvpn.store'

## Repeat dig cmd loop time (seconds) (positive interger only)

LOOP_DELAY=0



## Add your DNS here

declare -a HOSTS=('112.198.115.44')



## Linux' dig command executable filepath

## Select value: "CUSTOM|C" or "DEFAULT|D"

DIG_EXEC="DEFAULT"

## if set to CUSTOM, enter your custom dig executable path here

CUSTOM_DIG=/data/data/com.termux/files/home/go/bin/fastdig



######################################

######################################

######################################

######################################

######################################

VER=0.1

case "${DIG_EXEC}" in

 DEFAULT|D)

 _DIG="$(command -v dig)"

 ;;

 CUSTOM|C)

 _DIG="${CUSTOM_DIG}"

 ;;

esac

if [ ! $(command -v ${_DIG}) ]; then

 printf "%b" "Dig command failed to run, " \

 "please install dig(dnsutils) or check " \

 "\$DIG_EXEC & \$CUSTOM_DIG variable inside $( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )/$(basename "$0") file.\n" && exit 1

fi

endscript() {

 unset NS NS1 NS2 NS3 NS4 NS5 NS6 NS7 NS8 NS9 NS10 NS11 NS12 NS13 NS14 NS15 NS16 NS17 NS18 NS19 NS20 NS21 NS22 NS23 NS24 NS25 NS26 NS27 NS28 NS29 A LOOP_DELAY HOSTS _DIG DIG_EXEC CUSTOM_DIG T R M

 exit 1

}

trap endscript 2 15

check(){

 for ((i=0; i<"${#HOSTS[*]}"; i++)); do

  for R in "${A}" "${NS}" "${NS1}" "${NS2}" "${NS3}" "${NS4}" "${NS5}" "${NS6}" "${NS7}" "${NS8}" "${NS9}" "${NS10}" "${NS11}" "${NS12}" "${NS13}" "${NS14}" "${NS15}" "${NS16}" "${NS17}" "${NS18}" "${NS19}" "${NS20}" "${NS21}" "${NS22}" "${NS23}" "${NS24}" "${NS25}" "${NS26}" "${NS27}" "${NS28}" "${NS29}"; do

   T="${HOSTS[$i]}"
    $(timeout -k .1 .1 ${_DIG} @${T} ${R})  && M=31 || M=32;
   echo -e "\e[1;${M}m\$ R:${R} D:${T}\e[0m"
   unset T R M
  done
 done
}


echo "DNSTT Keep-Alive script <Discord @civ3>"

echo -e "DNS List: [\e[1;34m${HOSTS[*]}\e[0m]"

echo "CTRL + C to close script"

 "${LOOP_DELAY}" -eq 1  && let "LOOP_DELAY++";

case "${@}" in

 loop|l)

 echo "Script loop: ${LOOP_DELAY} seconds"

 while true; do

  check

  echo '.--. .-.. . .- ... .     .-- .- .. -'

  sleep ${LOOP_DELAY}

 done

 ;;

 *)

 check

 ;;

esac

exit 0