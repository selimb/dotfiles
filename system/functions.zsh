function x () {
    local dir="${1:=${PWD}}"
    xdg-open "$dir" >/dev/null 2>&1
}
