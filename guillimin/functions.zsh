# Grep fortran files with case insensitive
grepf () {
    echo "$1"
    grep -nHIi "$1" *.f
}
