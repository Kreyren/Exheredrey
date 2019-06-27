declare -g -a _ack_options
declare -g -a _ack_types=()

_ack_options=(
  "--ackrc" \
  "--after-context" \
  "--bar" \
  "--before-context" \
  "--break" \
  "--cathy" \
  "--color" \
  "--color-filename" \
  "--color-lineno" \
  "--color-match" \
  "--colour" \
  "--column" \
  "--context" \
  "--count" \
  "--create-ackrc" \
  "--dump" \
  "--env" \
  "--files-from" \
  "--files-with-matches" \
  "--files-without-matches" \
  "--filter" \
  "--flush" \
  "--follow" \
  "--group" \
  "--heading" \
  "--help" \
  "--help-types" \
  "--help-colors" \
  "--help-rgb-colors" \
  "--ignore-ack-defaults" \
  "--ignore-case" \
  "--ignore-dir" \
  "--ignore-directory" \
  "--ignore-file" \
  "--invert-match" \
  "--literal" \
  "--man" \
  "--match" \
  "--max-count" \
  "--no-filename" \
  "--no-recurse" \
  "--nobreak" \
  "--nocolor" \
  "--nocolour" \
  "--nocolumn" \
  "--noenv" \
  "--nofilter" \
  "--nofollow" \
  "--nogroup" \
  "--noheading" \
  "--noignore-dir" \
  "--noignore-directory" \
  "--nopager" \
  "--nosmart-case" \
  "--output" \
  "--pager" \
  "--passthru" \
  "--print0" \
  "--recurse" \
  "--show-types" \
  "--smart-case" \
  "--sort-files" \
  "--thpppt" \
  "--type" \
  "--type-add" \
  "--type-del" \
  "--type-set" \
  "--version" \
  "--with-filename" \
  "--word-regexp" \
  "-1" \
  "-A" \
  "-B" \
  "-C" \
  "-H" \
  "-L" \
  "-Q" \
  "-R" \
  "-S" \
  "-c" \
  "-f" \
  "-g" \
  "-h" \
  "-i" \
  "-l" \
  "-m" \
  "-n" \
  "-o" \
  "-r" \
  "-s" \
  "-v" \
  "-w" \
  "-x" \
)

function __setup_ack() {
    local type

    while read LINE; do
        case $LINE in
            --*)
                type="${LINE%% *}"
                type=${type/--\[no\]/}
                _ack_options[ ${#_ack_options[@]} ]="--$type"
                _ack_options[ ${#_ack_options[@]} ]="--no$type"
                _ack_types[ ${#_ack_types[@]} ]="$type"
            ;;
        esac
    done < <(ack --help-types)
}
__setup_ack
unset -f __setup_ack

function _ack_complete() {
    local current_word
    local pattern

    current_word=${COMP_WORDS[$COMP_CWORD]}

    if [[ "$current_word" == -* ]]; then
        pattern="${current_word}*"
        for option in ${_ack_options[@]}; do
            if [[ "$option" == $pattern ]]; then
                COMPREPLY[ ${#COMPREPLY[@]} ]=$option
            fi
        done
    else
        local previous_word
        previous_word=${COMP_WORDS[$(( $COMP_CWORD - 1 ))]}
        if [[ "$previous_word" == "=" ]]; then
            previous_word=${COMP_WORDS[$(( $COMP_CWORD - 2 ))]}
        fi

        if [ "$previous_word" == '--type' -o "$previous_word" == '--notype' ]; then
            pattern="${current_word}*"
            for type in ${_ack_types[@]}; do
                if [[ "$type" == $pattern ]]; then
                    COMPREPLY[ ${#COMPREPLY[@]} ]=$type
                fi
            done
        fi
    fi
}

complete -o default -F _ack_complete ack ack2 ack-grep
