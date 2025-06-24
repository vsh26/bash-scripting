#!/usr/bin/env bash

echo "Hello World"

#variables
name="Hulk"
age=50
echo "Hi, $name!"
echo "Age: $age"

#arrays
languages=(JS C++ Java Python "Bash Scripting")

#access single itm
echo ${languages[0]}

#list all items in array
echo ${languages[@]}

#length of the array
echo ${#languages[@]}


#for loop
for((i=0; i<${#languages[@]}; i++)); do
    echo "Index $i = ${languages[$i]}"
done

#for loop
for language in "${languages[@]}"; do
    echo "$language"
done

# maps
# declare -A prices
# prices[Pizza]=400
# prices[Salad]=100
# prices[Rolls]=300

# echo $prices[Pizza]

# control-flow

points=50

if [[ $points -gt 40 ]]; then
    echo "You are pass"
else
    echo "You are fail"
fi

if [ -f hello.txt ]; then
    echo "File.txt"
else
    echo "File does not exist"
    echo "Creating file"
    touch hello.txt
fi

if [ -d src ]; then
    echo "Dir exist"
else
    echo "Dir does not exist"
    echo "Creating dir"
    mkdir src
fi


#list file for processing
for file in *.txt; do
    echo "$file"
done

#writing into file (overwrite the data)
echo "this is my data" > hello.txt

#if file does not exist, it will create file
echo "this is my data" > config.txt

#writing into file (append the data)
echo "this is new data" >> hello.txt

#Heredoc
#<<EOF tells the shell: start reading input until you find a line that exactly matches EOF.
#this is useful when we want to write multiple lines into a file
cat <<EOF > about.txt
this is my first line
this is my second line
this is my third line
this is my fourth line
EOF

#functions
greet(){
    echo "Hello, $1"
}

greet "Iron Man"