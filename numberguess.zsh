: '
---
What do I need to make a number guessing game?
Picking random numbers
Input
If statements
Output
loop statements (for each failed aptempt increase by 1)
lose state (number of tries > x )
error states

---
.zsh is ran with zsh <filename>
---

echo ""                         >output
print -P "....{colourname}message...." > output with colours. ex: print -P "%B%F{green}You win!%f%b"
num=5 or num="ten"              > variables
$num                            > reading them. ex: if [[ $num == 10 ]]; then
$(( ( RANDOM % 1) + 1))         > random numbers

read "variable?question"        > outputs <question> and inputs to variable <variable>
read "variable?"                >read and assign to "variable"
echo "your guess was $variable" > output "variable"

echo ""                         > new line


if [[  conditions  ]]; then         > [[ $var -eq $num]] then means var = num then. -eq is equal | -ne is not equal
    echo "conditions are true"                                                      -gt is greater| -lt is less than
else                                >else statements
    echo "conditions are false"
fi


while [[ conditions ]]; do
    echo "this thing"           > if conditions are true and echo "this thing" has finished restart
done

tries=0                          > sets tries to 0
(( tries++ ))                    > adds 1 to tries

play_game() {
    ...                          > functions, call them whenever
}
---
'


play_game() {

    tries=0
    num=$(( ( RANDOM % 30) + 1))

    echo "you get 10 tries!"
    echo ""


    while [[ tries -lt 10 ]]; do
        (( tries++ ))
        read "guess?What is your guess?"

        if [[ $guess -lt $num ]]; then
            echo "Number is higher"
        fi

        if [[ $guess -gt $num ]]; then
            echo "Number is lower"
        fi

        if [[ $guess -eq $num ]]; then
            print -P "%B%F{green}You win!%f%b"
            echo "Tries: $tries"
            read "again?Play again? (Y/N) "
            if [[ $again == Y ]]; then
                play_game
            else
                return
            fi
        fi
    done

    if [[ $tries -eq 10 ]]; then
        echo ""
        print -P "%B%F{red}You lost!%B%F"
        echo "The number was $num"
        read "again?Play again? (Y/N) "
        if [[ $again == Y ]]; then
            play_game
        else
            return
        fi
    fi
} #end play_game

play_game
#yayy!
