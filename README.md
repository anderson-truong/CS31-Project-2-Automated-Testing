# CS31 Winter22 Project 2: Automated Testing

>**DISCLAIMER:** these testing scripts are by no means an *official* measure of the correctness of your program.
It is simply my way of automatically testing my own program according to the project spec.
You should definitely use your own test cases, but if you do use my script, I am not responsible if your program misses certain cases.

# How to use:
### There are two versions for each OS: 
1. A regular version (e.g. `test_XXX.sh`)
2. A version with more output messages (e.g. `test_XXX_verbose.sh`)

I recommend using the regular version since the verbose version was more for debugging the script.

### Windows Setup
1. Install [Git Bash](https://git-scm.com/download/win) (or anything that allows you to run .sh scripts). You should be able to run shell `.sh` scripts now.

2. Download `test_WINDOWS.sh` from this repository.

3. Compile your `payment.cpp` file to an executable `.exe`.
If you use an IDE like Visual Studio, you can build your project and then find the `.exe` file in a folder somewhere. For example, mine is in `Project2/Debug/Project2.exe`. Yours might be in something called `source/repos/YourProjectName/Debug/YourProjectName.exe`.

4. Rename this executable file to `payment.exe`.

5. Put `test_WINDOWS.sh` and `payment.exe` in the same folder. 

6. Click on the shell script to run it.

### Linux Setup (UCLA servers with the g31 compiler)
1. Download `test_LINUX.sh` from this repository.

2. Connect to the UCLA VPN.

3. Upload your `payment.cpp` file and the `test_LINUX.sh` script to the Linux server through WinSCP or the Remote Desktop Connection (Work Resources)

4. Move the `payment.cpp` file and `test_LINUX.sh` to the Z: folder (the folder's name should be your username)

5. Compile your `payment.cpp` folder to `payment`. You can do this with `g31 -o payment payment.cpp`

6. Open putty and connect to `lnxsrv07.seas.ucla.edu`.

7. Type in `chmod u+x test_LINUX.sh`. This will give the script permission to run.

8. Run the shell script with `./text_LINUX.sh`

# How to Interpret Results
The script runs through 3 testing stages: **Input Invalidation**, **Tax Free Day Validation**, and **After-Tax Price Validation**.

### 1. Input Invalidation
This stage will test the 5 invalid user inputs.
  
If each invalid input has been handled correctly by your program, the script will print `Correct!`.
If the invalid input has NOT been handled correctly, it will print out a message according to the invalid input.

For example, if "north america" is inputted to the **state** user input, your program should output `Invalid state!`.
If it does not output this, the script will print out `Invalid state not handled for. Tested: north america`

### 3. Tax Free Day Validation
This stage will test the edge cases of the tax-free day range for each state that has tax-free days.

For example, if your program fails to do a tax-free calculation for Alabama on July, 15 2020, the script will print out `Error! Tax-Free Day not handled for: Alabama July 15 2020`

If it works, it will print out `July 15 Correct!`

### 5. After-Tax Price Validation
This stage will compare your program's final calculation for a purchase of $30.56 against the actual value. It will also test whether your user-prompting text and output line are correct.

If your prompt text (e.g. State Name:, Purchase Amount:, etc) is incorrect, the script will print `Your prompt text is incorrect!`. **Otherwise, it will NOT print anything**.

If your output line text is incorrect (e.g. Please pay a total of $) for let's say Nevada on September 3, the script will print `Wrong output text!` and `Nevada September 3`. **Otherwise, it will NOT print anything**.

If your final calculation is incorrect for let's say California on April 2, the script will print out `Wrong calculated total!` `California April 2` `Real value: $33.480000`. **Otherwise, it will NOT print anything**.

If you end up with no calculation errors, this section WILL NOT print out anything (on the non-verbose script).

> NOTE: If you see all 3 of these errors, your error is most likely with the grammar of your prompt text. If you see 2, it is most likely the output line text.

# Included Test Cases:
The script iterates over some valid/invalid state names, months, days, and years, and then runs the compiled project .cpp file with those inputs.

**States Tested**
- Valid (50): All 50 states. **Ex:** West Virginia, Arizona, North Dakota, ...
- Invalid (2): **west virginia**, **north america**

**Purchase Amounts Tested:**
- Valid (1): **30.56**
- Invalid (2): **0**, **-30.56**

**Months Tested**
- Valid (12): **January**, **February**, **March**, **April**, **May**, **June**, **July**, **August**, **September**, **October**, **November**, **December**
- Invalid (2): **jan**, **January 5**

**Days Tested**
- Valid (2): **1**, **31**
- Invalid (2): **0**, **32**

**Years Tested**
- Valid (1): **1000**
- Invalid (2): **0**, **2026**
