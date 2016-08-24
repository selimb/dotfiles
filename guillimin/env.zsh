# Only show host name if on Guillimin supercomputer, in which case show
# "guillimin" instead of the random node.
hostname=$(hostname)
pattern="[a-z]{2}-[0-9][a-z][0-9]{2}-[a-z][0-9]{2}"
if $(echo $hostname | grep -E $pattern &> /dev/null); then
    export GUILLIMIN=1
    # Not on login node
    if [ $hostname[0,2] != "lg" ]; then
        export GUILLIMIN_JOB_NODE=1
    fi
fi

unset hostname pattern
