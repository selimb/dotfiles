# Only show host name if on Guillimin supercomputer, in which case show
# "guillimin" instead of the random node.
hostname=$(hostname)
if [ $hostname[0,4] = "lg-1" ]; then
    export GUILLIMIN=1
fi
unset hostname
