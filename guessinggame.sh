count_files() {
    find . -maxdepth 1 -type f | wc -l
}

check_guess() {
    if [[ $guess -lt $total ]]; then
        echo "Too low! Try again."
    elif [[ $guess -gt $total ]]; then
        echo "Too high! Try again."
    else
        echo "Congratulations! Correct answer!"
    fi
}

total=$(count_files)
guess=-1

echo "Welcome to the Guessing Game!"
echo "Guess the number of files in this directory."

while [[ $guess -ne $total ]]
do
    read -p "Enter your guess: " guess

    if [[ ! $guess =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid number."
        guess=-1
        continue
    fi

    check_guess
done

echo "Game finished!"
