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
  - [Logical Operators](#logical-operators) - `&&`, `||`, `!`
  - [File Test Operators](#file-test-operators) - `-d`, `-e`, `-f`, `-s`, `-r`, `-w`, `-x`
- [Loops](#-loops)
  - [`for` loop](#for-loop)
  - [`while` loop](#while-loop)
  - [`until` loop](#until-loop)
  - [`break` and `continue`](#break-and-continue)
- [Functions](#%EF%B8%8F-functions)
  - [Argument variables in bash](#argument-variables-in-bash) - `$0`, `$1`, `$10`, `$#`, `$@`, `$*`
  - [Exit codes](#exit-codes) - `$?`
- [`trap` command](#-trap-command)
  - [Common signals](#common-signals) - `SIGINT`, `SIGTERM`, `EXIT`, `ERR`
- [Arrays](#-arrays)
- [Bash script debugging](#-bash-script-debugging) - `set -x`, `set -e`, `set -u`, `set -o pipefail`, etc.
- [Working with files](#-working-with-files)
- [Cron Jobs](#-cron-job)
  
## 📟 Bash
- Bash (Bourne Again Shell) is a command interpreter.
- It’s both an interactive shell and a scripting language.

<p align="right"><a href="#-table-of-contents">Back to TOC</a></p>

## </> Bash Scripting
- A Bash script is a plain text file containing a series of commands that are executed in a sequence by the Bash shell. It's like writing down a series of terminal commands in a file so they can run together.
- They are used to automate tasks and to perform complex operations.
- File extension: `.sh` (though it's not mandatory).

<p align="right"><a href="#-table-of-contents">Back to TOC</a></p>

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

<p align="right"><a href="#-table-of-contents">Back to TOC</a></p>

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

<p align="right"><a href="#-table-of-contents">Back to TOC</a></p>

## 📥 User Input
```bash
#!/bin/bash
read -p "Enter your name: " name
echo "Welcome, $name!"
```

- `read` - Reads input from user
- `-p` - Prompts the user with a message

<p align="right"><a href="#-table-of-contents">Back to TOC</a></p>

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

<p align="right"><a href="#-table-of-contents">Back to TOC</a></p>

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
| `!`      | Logical NOT | 

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

<p align="right"><a href="#-table-of-contents">Back to TOC</a></p>

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
<p align="right"><a href="#-table-of-contents">Back to TOC</a></p>

## 🛠️ Functions

```bash
greet() {
    echo "Hello, $1!"
}

greet "Vishal"
```
- `$1` is the first argument passed to the function.

### Argument variables in bash

| Variable     | Description                                         |
| ------------ | --------------------------------------------------- |
| `$0`         | Name of the script itself                           |
| `$1` to `$9` | First 9 arguments (use `${10}` for more than 9)     |
| `$#`         | Total number of arguments passed                    |
| `$@`         | Treats each argument as a separate string (Preserve individual arguments) |
| `$*`         | Treats all arguments as one string                  |

<br>

### Exit codes
Every command in Bash returns an exit code (return status) to indicate success or failure.

- `0` means success
- Non-zero means error (e.g., `1`, `2`, `127`, etc.)

```bash
#!/bin/bash

mkdir myfolder
echo "Exit code: $?"
```
- `$?` holds the exit status of the last run command

<p align="right"><a href="#-table-of-contents">Back to TOC</a></p>

## 🪤 `trap` command
- `trap` lets you catch signals or events and run a specific command when they occur. Think of it as an interrupt handler.
- Basic syntax:
  ```bash
  trap '<commands>' SIGNAL
  ```

### Common signals
| Signal    | Meaning                              | How to trigger |
| --------- | ------------------------------------ | -------------- |
| `SIGINT`  | Interrupt                            | Ctrl + C       |
| `SIGTERM` | Termination                          | `kill <pid>`   |
| `EXIT`    | On script exit                       | Automatically  |
| `ERR`     | On any command error (with `set -e`) |                |

<br>

**Example:** Catch Ctrl+C
```bash
#!/bin/bash

trap "echo 'Interrupted! Cleaning up...'; exit 1" SIGINT

while true; do
    echo "Running..."
    sleep 1
done
```

**Example:** Clean up temp files on exit
```bash
#!/bin/bash

tempfile="/tmp/mytempfile.txt"
touch "$tempfile"

trap "echo 'Removing $tempfile'; rm -f $tempfile" EXIT

echo "Working with temp file..."
sleep 5
```

<p align="right"><a href="#-table-of-contents">Back to TOC</a></p>

## 📦 Arrays

**Declaring array**
```bash
fruits=("apple" "banana" "cherry")
```

**Accessing elements**
```bash
echo "fruits[0]: ${fruits[0]}"  
echo "fruits[1]: ${fruits[1]}"
```

**Add or Update elements**
```bash
fruits[3]="orange"
fruits[1]="blueberry"
echo "After update and addition: ${fruits[@]}"
```

**Get all elements**
```bash
echo "All elements: ${fruits[@]}"
echo "All indexes: ${!fruits[@]}"
```

**Get Length**
```bash
echo "Length of array: ${#fruits[@]}"
```

**Loop through array**
```bash
for fruit in "${fruits[@]}"; do
    echo "Fruit: $fruit"
done
```

**Loop through indexes**
```bash
for i in "${!fruits[@]}"; do
    echo "Index $i: ${fruits[$i]}"
done
```

**Delete elements**
```bash
unset 'fruits[1]'
echo "After deleting index 1: ${fruits[@]}"
```

**Empty entire array**
```bash
unset fruits
echo "After unset: ${fruits[@]}"
```

<p align="right"><a href="#-table-of-contents">Back to TOC</a></p>

## 🐞 Bash script debugging
Debugging bash scripts is essential when you're automating tasks or writing complex logic. Bash provides built-in tools to make this easier.

### Some bash debugging options
| Option / Tool       | Purpose                                               | How to Use                       | Notes                                                               |
| ------------------- | ----------------------------------------------------- | -------------------------------- | ------------------------------------------------------------------- |
| `set -x`            | Print each command before executing                   | `set -x` / `set +x`              | Helps trace command-by-command execution                            |
| `set -e`            | Exit the script immediately on any command failure    | `set -e`                         | Prevents cascading failures                                         |
| `set -u`            | Treat unset variables as an error                     | `set -u`                         | Catches typos or forgotten variables                                |
| `set -o pipefail`   | Return failure if **any** command in a pipeline fails | `set -o pipefail`                | Useful in pipelines like `grep\| awk`                               |
| `trap '...' ERR`    | Run custom code when any command fails                | `trap 'echo "Error!"' ERR`       | Common for logging or cleanup                                       |
| `trap '...' EXIT`   | Run code on script exit (normal or error)             | `trap 'cleanup' EXIT`            | Good for temp file cleanup                                          |
| `trap '...' SIGINT` | Catch Ctrl+C (interrupt) signal                       | `trap 'echo Interrupted' SIGINT` | Prevents abrupt termination                                         |
| `bash -x script.sh` | Debug a script from terminal (like `set -x`)          | Run directly from terminal       | Useful without editing the script                                   |
| `bash -e script.sh` | Run with exit-on-error mode (like `set -e`)           | Run directly from terminal       | Combine with `-x` for full tracing and safety: `bash -xe script.sh` |

<br>

**Example:** Combine All Debug Options (Recommended for Serious Scripts)
```bash
#!/bin/bash
set -euo pipefail
# -e: exit on error
# -u: treat unset variables as error
# -o pipefail: fail if any command in pipeline fails

trap 'echo "Error occurred on line $LINENO"' ERR

# Your code below
```

<p align="right"><a href="#-table-of-contents">Back to TOC</a></p>

## 📑 Working with files

**Reading from a file** (Using `while` `read` loop)

```bash
while IFS= read -r line; do
    echo "Line: $line"
done < input.txt
```
- `IFS=` prevents trimming leading/trailing whitespace
- `-r` prevents backslash escaping

input.txt:
```
Hello
World
```
Output:
```
Line: Hello
Line: World
```

**Reading all lines into an array**
```bash
mapfile -t lines < input.txt

for line in "${lines[@]}"; do
    echo "$line"
done
```
- mapfile is efficient for reading files into arrays.
- `-t` removes trailing newlines.

**Writing to a file**
```bash
echo "Hello, World!" > output.txt
```
- Overwrites the file if it exists.
- Creates a new file if it doesn't.

**Appending to a file**
```bash
echo "New line" >> output.txt
```
- Adds to the end of the file without overwriting existing content.

**heredoc (here document)**
- A here document (often called a heredoc) is a way to pass multiple lines of input to a command directly within a shell script or command line.
- **Syntax:**
  ```bash
  command <<DELIMITER
  multi-line content
  more content
  DELIMITER
  ```
- `<<DELIMITER`: Marks the beginning.
- `DELIMITER` (usually `EOF`, but we can use any word in place of `EOF`, it is just a label. ) must appear on a line by itself, with no spaces or tabs, to signal the end.
- Usually used with commands like `cat`, `tee`, `read`, `ssh`, `mysql`, etc.

**Writing multiple lines into a file - use heredoc**
```
cat <<EOF > myfile.txt
Hello!
This file was created using heredoc.
EOF
```

**Redirecting output of commands**
```bash
ls -l > files.txt      # Save output to file
ls -l >> files.txt     # Append output to file
```

**Deleting a file**
``` bash
rm file.txt            # Without confirmation prompt
rm -i filename.txt     # With confirmation prompt
```

**Checking If a file exists**
```bash
if [ -f "myfile.txt" ]; then
    echo "File exists"
else
    echo "File does not exist"
fi
```
- `-f` checks if it's a regular file
- `-d` for directories
- `-e` for any file or directory

<p align="right"><a href="#-table-of-contents">Back to TOC</a></p>

## 🕒 Cron job
- A cron job is a scheduled task or scripts that runs automatically at specified intervals (like every day, every hour, every minute, etc.).
- It’s managed by a Linux system service called cron.

### Why use cron jobs?
To automate repetitive tasks, like:
- Running backups
- Cleaning log files
- Sending reports
- Updating a database
- Scheduling a shell script

### How to create a cron job?
```bash
crontab -e
```
- Opens your user’s cron table (crontab) in an editor
- The job is to be added in specific format

### Cron job syntax
```bash
* * * * * command_to_run
│ │ │ │ │
│ │ │ │ └─ Day of the week (0-7) (0 or 7 = Sunday)
│ │ │ └─── Month (1–12)
│ │ └───── Day of the month (1–31)
│ └─────── Hour (0–23)
└───────── Minute (0–59)
```

### Examples

1. **Run every minute:**
  ```bash
  * * * * * echo "I run every minute" >> /tmp/test.log
  ```

2. **Run every day at 4 PM:**
  ```bash
  0 16 * * * /home/vishal/backup.sh
  ```

3. **Run on the 1st of every month:**
  ```bash
  0 0 1 * * /home/vishal/monthly_report.sh
  ```

4. **Run every Monday at 10:30 AM:**
  ```bash
  30 10 * * 1 /home/vishal/weekly_cleanup.sh
  ```

### View your crontab
```bash
crontab -l
```

### Remove your crontab
```bash
crontab -r
```

### Cron logs (Ubuntu/Debian)
```bash
grep CRON /var/log/syslog
```

### `@` keywords for easier setup
| Keyword    | Meaning             |
| ---------- | ------------------- |
| `@reboot`  | Run once at startup |
| `@hourly`  | Every hour          |
| `@daily`   | Every day           |
| `@weekly`  | Every week          |
| `@monthly` | Every month         |
| `@yearly`  | Every year          |

<br>

Example:
```bash
@daily /home/vishal/daily_backup.sh
```

<p align="right"><a href="#-table-of-contents">Back to TOC</a></p>

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
