#!/bin/bash

set -e

KEEPER="keeper --config=${HOME}/.config/keeper/config.json"
MAIN_PP_ID='vaNd8EAyY99f68hLkZTOCQ'
GITLAB_PP_ID='3MV0xbC3Ja73DUDQLRmJlA'

function keeper_get_password() {
    ${KEEPER} get ${1} --password ${2} \
        | grep 'Password' \
        | tr -d '[:space:]' \
        | cut -d ':' -f2
}

echo -n 'Enter keeper password: '
read -s KEEPER_PASSWORD

PASSWORD1="$(keeper_get_password ${MAIN_PP_ID} ${KEEPER_PASSWORD})"
PASSWORD2="$(keeper_get_password ${GITLAB_PP_ID} ${KEEPER_PASSWORD})"
echo "${PASSWORD1}" | xclip -selection clipboard
ssh-add ~/.ssh/id_rsa
echo "${PASSWORD2}" | xclip -selection clipboard
ssh-add ~/.ssh/gitlab
echo "" | xclip -selection clipboard
