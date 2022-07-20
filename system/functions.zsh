function x () {
    local dir="${1:=${PWD}}"
    xdg-open "$dir"
}