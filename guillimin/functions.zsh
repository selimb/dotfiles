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
        results=$(grep "$grepopts" "$pattern" *.f *.F)
    fi
    echo "$results"
}
