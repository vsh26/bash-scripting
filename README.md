# 👨‍💻 Bash Scripting

## ☰ Table of Contents
- [Bash](#-bash)
- [Bash Scripting](#-bash-scripting)
- [Basic Structure of a Bash Script](#%EF%B8%8F-basic-structure-of-a-bash-script) `#!`, `#`, `;`, `echo`
- [Variables](#-variables) - `=`, `$`
- [User Input](#-user-input) - `read`, `-p`
- [Conditional Statements](#-conditional-statements) - `if`, `else`, `elif`
- [Operators](#%EF%B8%8F-operators)
  - [Comparison Operators](#comparision-operators) - `-eq`, `-ne`, `-lt`, `-le`, `-gt`, `-ge`
  - [String Comparison Operators](#string-comparison-operators) - `=`, `!=`, `>`, `<`
  - [Arithmetic Operators](#arithmetic-operators) - `+`, `-`, `*`, `/`, `%`
  - [Logical Operators](#logical-operators) - `&&`, `\|\|`, `!`
  - [File Test Operators](#file-test-operators) - `-d`, `-e`, `-f`, `-s`, `-r`, `-w`, `-x`
- [Loops](#-loops)
  - [`for` loop](#for-loop)
  - [`while` loop](#while-loop)
  - [`until` loop](#until-loop)
  - [`break` and `continue`](#break-and-continue)

## 📟 Bash
- Bash (Bourne Again Shell) is a command interpreter.
- It’s both an interactive shell and a scripting language.

## </> Bash Scripting
- A Bash script is a plain text file containing a series of commands that are executed in a sequence by the Bash shell. It's like writing down a series of terminal commands in a file so they can run together.
- They are used to automate tasks and to perform complex operations.
- File extension: `.sh` (though it's not mandatory).

## 🏗️ Basic Structure of a Bash Script

```bash
#!/bin/bash
# This is a comment

echo "Hello, World!"; echo "Good Morning!"
```
- `#!` - Shebang (used to tell system which shell to use to execute script)
- `#!/bin/bash` - Tells system to use bash shell to execute script
- `#` - Anything after `#` is a comment
- `echo` - Prints text to the terminal
- `;` - Semicolons allow multiple commands on the same line

Save the file as `myscript.sh` and make it executable:
```
chmod +x myscript.sh
./myscript.sh
```

## 🔡 Variables
```bash
#!/bin/bash
name="Hulk"
echo "Hello, $name!"

greeting="Hello, "
name="World"
echo "$greeting$name"        #Concatenation
echo "${greeting}${name}123"
```
- No space around `=`
- Access with `$`
- Using quotes `" "` helps in preserving spaces and special characters

## 📥 User Input
```bash
#!/bin/bash
read -p "Enter your name: " name
echo "Welcome, $name!"
```

- `read` - Reads input from user
- `-p` - Prompts the user with a message

## ❓ Conditional Statements
Shell scripts support `if`, `else`, `elif` (else-if), just like other languages.

```bash
if [ condition ]; then
  # commands
elif [ another_condition ]; then
  # commands
else
  # fallback
fi
```
- **Note:** Always use spaces inside the brackets: `[ $a -gt 10 ]` (NOT `[ $a-gt10 ]`)

## ⚙️ Operators
### Comparision Operators

| Operator | Description              |
|----------|--------------------------|
| `-eq`    | Equal to                 |
| `-ne`    | Not equal to             |
| `-lt`    | Less than                |
| `-le`    | Less than or equal to    |
| `-gt`    | Greater than             |
| `-ge`    | Greater than or equal to |

### String Comparison Operators
  
| Operator | Description                               |
|----------|-------------------------------------------|
| `=`      | Equal to                                  |
| `!=`     | Not equal to                              |
| `<`      | Less than, in ASCII alphabetical order    |
| `>`      | Greater than, in ASCII alphabetical order |

- **Note:** For string comparisions use `[[ ... ]]`, as `<` and `>` are not safe with `[ ]` — they can be misinterpreted as redirection operators.

### Arithmetic Operators

| Operator | Description    |
|----------|----------------|
| `+`      | Addition       |
| `-`      | Subtraction    |
| `*`      | Multiplication |
| `/`      | Division       |
| `%`      | Modulus        |

- **Note:** For exponentiation, use external tools like `bc` or `awk`.

**Example:**
```bash
a=10
b=20
sum=$((a + b))
echo "Sum is $sum"
```


### Logical Operators
  
| Operator | Description |
|----------|-------------|
| `&&`     | Logical AND |
| `\|\|`   | Logical OR  |
| `!`      | Logical NOT |           |

### File Test Operators
  
| Operator | Description                       |
|----------|-----------------------------------|
| `-e`     | Check if a file exists            |
| `-d`     | Check if a directory exists       |
| `-f`     | Check if a file is a regular file |
| `-s`     | Check if a file is not empty      |
| `-r`     | Check if a file is readable       |
| `-w`     | Check if a file is writable       |
| `-x`     | Check if a file is executable     |


## 🔄 Loops

### `for` loop
```bash
for i in 1 2 3 4 5; do
  echo "Value: $i"
done
```

### `while` loop
```bash
count=1
while [ $count -le 5 ]; do
  echo "Count is $count"
  ((count++))              #(( )) is used for arithmetic operations
done
```

### `until` loop
```bash
count=1
until [ $count -gt 5 ]; do
  echo "Until loop: $count"
  ((count++))
done
```

### `break` and `continue`
```bash
for i in {1..5}; do
  if [ $i -eq 3 ]; then
    continue
  fi
  echo "Number $i"
  if [ $i -eq 4 ]; then
    break
  fi
done
```

## 📬 Connect with Me  
  
<div align="center">

[![X](https://img.shields.io/badge/X-%23000000.svg?logo=X&logoColor=white)](https://twitter.com/VishalKapgate)
[![Gmail](https://img.shields.io/badge/Gmail-D14836?logo=gmail&logoColor=white)](mailto:vishaldk26@gmail.com)
[![LinkedIn](https://custom-icon-badges.demolab.com/badge/LinkedIn-0A66C2?logo=linkedin-white&logoColor=fff)](https://linkedin.com/in/vishalkapgate)
[![Peerlist](https://img.shields.io/badge/-Peerlist-00AA45?style=flat&logo=peerlist&logoColor=white)](https://peerlist.io/vishalkapgate)

</div>

## 🤝 Contributing
Contributions are welcome!  

- Found an error? Let me know (even spelling mistakes count! 📝).  
- Have useful learning notes? Feel free to fork & enhance this repository!
