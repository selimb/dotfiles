# Only show host name if on Guillimin supercomputer, in which case show
# "guillimin" instead of the random node.
hostname=$(hostname)
if [ $hostname[0,4] = "lg-1" ]; then
    export GUILLIMIN=1
elif [ $hostname[0,2] = "sw" ]; then
    export GUILLIMIN=1
    export GUILLIMIN_JOB_NODE=1
fi
unset hostname

# PYTHONPATH
local SYN3D=/sb/project/rck-371-aa/selimb/syn3d
export PYTHONPATH="$SYN3D/python:$SYN3D/bin:$PYTHONPATH"
