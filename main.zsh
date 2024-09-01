todos() {
    if [[ "$1" == "list" ]]; then
        todos-list $2
    fi

    if [[ "$1" == "capture" ]]; then
        todos-capture
    fi

    if [[ "$1" == "open" ]]; then
        todos-open
    fi
}

todos-list() {
    if [[ "$1" == "" ]]; then
        result=$(grep -n "\- \[ \]" ~/Notes/todo.md | fzf | awk '{print $1}' | grep -o '[[:digit:]]\+')
        if [[ "$result" == "" ]]; then
        else
            vim +$result ~/Notes/todo.md
        fi
    elif [[ "$1" == "A" || "$1" == "B" || "$1" == "C" ]]; then
        result=$(grep -n "\- \[ \]" ~/Notes/todo.md | grep "($1)" | fzf | awk '{print $1}' | grep -o '[[:digit:]]\+')
        if [[ "$result" == "" ]]; then
        else
            vim +$result ~/Notes/todo.md
        fi
    else
        echo "Please pick a correct priority level"
    fi
}

todos-capture() {
    filename=$RANDOM
    vim /tmp/$filename.md
    cat /tmp/$filename.md >> ~/Notes/todo.md
}

todos-open() {
    vim ~/Notes/todo.md
}
