# Grep fortran files with case insensitive
grepf () {
    echo "$1"
    grep -nHIi "$1" *.f
}

# Grep fortran files for a variable assignment
# Grep options: -n Show line number
#               -H With filename
#               -I Don't process binary files
#               -i Ignore case
#               -P Perl RegEx
findvar () {
    grepopts="-nHIiP"
    pattern="\s+$1\s*(?:\(.*=|=)"
    shift;
    if [ $1 ]; then
        results=$(grep "$grepopts" "$pattern" $*)
    else
        results=$(grep "$grepopts" "$pattern" *.f)
    fi
    echo "$results"
}

# Copy syn3d python shared object to current directory. 
# First argument: name of directory (default testbin)
copypy () {
    dir="testbin"
    if [ $1 ]; then
        dir="$1"
    fi
    cp "$SYN3D/$dir/_pysyn107mb.so" .
}
