#!/bin/bash
# My bash functions go here. To be sourced by $HOME/.bashrc.

        #########################
        #     yorn              #
        #########################

# yorn: Displays a message provided by the user and expects a "y" or "n" in
# response. The response is located in $REPLY.

yorn() {
    usage (){
        echo "Usage: yorn message | -h"
        echo "There must be only 1 argument."
        echo "Either the message you wish to display or -h"
    }

    if [[ $# != 1 ]]
    then
        usage
        return 1
    elif [[ $1 == -h ]]
    then
        usage
        return 1
    fi
    
    unset REPLY

    while [[ $REPLY != y && $REPLY != n ]]
    do
        echo -n $1
        read -n 1 REPLY
        echo
    done

}


        ###########
        # etime   #
        ###########

# etime - a function to measure the time taken for a program to run. Needs
# start and end times as arguments.

etime (){
    usage () {
        echo "Usage: etime start_time end_time"
        echo "start_time and end_time in seconds."
        echo "For this help  etime [-h]"
    }

    #if [[ $# -gt 2 || $# -eq 0 || $1 == -h ]]
    if [[ $# -ne 2 ]]
    then
        usage
        return 1
    fi

    start=$1
    end=$2
    echo "Start time =  $start"
    echo "end time = $end"
    elapsed=$((end - start))
    days=00
    hrs=00
    mins=00
    secs=$((elapsed % 60))
    mins=$((elapsed / 60 % 60))
    hrs=$((elapsed / 3600))
    printf "Time elapsed = %02d:%02d:%02d\n" $hrs $mins $secs
}

	#########################
	#   CHECK GIT STATUS	#
	#########################

is_git_dir () {
    if [[ -d .git ]]; then
	echo "Git repository"
    fi
}
