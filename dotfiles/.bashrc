#!/bin/bash
RHEL_VER=$(uname -r | sed 's/^.*\(el[0-9]\+\).*$/\1/')
export RHEL_VER

if [[ "${RHEL_VER}" == "el8" ]]; then
    if [-n "$SSH_CONNECTION" ]
    then
        source "$HOME"/.dotfiles/.bashrc_rhel8;
    else
        source "$HOME"/.dotfiles/.bashrc_rhel8_ssh;
    fi
elif [[ "${RHEL_VER}" == "el7" ]]; then
    if [ -n "$SSH_CONNECTION" ]
    then
        source "$HOME"/.dotfiles/.bashrc_rhel7;
    else
        source "$HOME"/.dotfiles/.bashrc_rhel8_ssh;
    fi
fi
