# Guide to ANTLR


## Installation Guide
This guide will help you download and set up ANTLR on Windows, including configuring class variables and paths.

### 1. Download ANTLR
1. Visit the [ANTLR website](https://www.antlr.org/download.html).
2. Under **"Tools"**, download the **`antlr-4.x-complete.jar`** file. 
   - You can directly download the file from [here](https://www.antlr.org/download/antlr-4.13.0-complete.jar).

### 2. Set up the `ANTLR_JAR` Environment Variable

You need to define the `ANTLR_JAR` environment variable, which will point to your downloaded `antlr-4.x-complete.jar` file.

1. Open **Start Menu**, search for **"Environment Variables"**, and select **"Edit the system environment variables"**.

2. In the **System Properties** window, click **"Environment Variables..."**.

3. Under **User variables** (or **System variables** if you want it system-wide), click **New** and enter the following:    
    - **Variable Name**: `ANTLR_JAR`
    - **Variable Value**: `C:\tools\antlr\antlr-4.x-complete.jar`
    Replace `C:\tools\antlr\antlr-4.x-complete.jar` with the correct path where you've saved the ANTLR jar file.

### 3. Set up the `Path` Variable
To ensure you can run ANTLR commands globally, you should also add the directory where the `antlr-4.x-complete.jar` file resides to the `Path` environment variable.

1. In the **Environment Variables** window (as described above), find and select the **Path** variable under **User variables** or **System variables**, then click **Edit**.
 
2. Click **New** and add the path to the directory containing the `antlr-4.x-complete.jar`, which would be:
	  ```
   `C:\tools\antlr
	```    
3. Click **OK** to save your changes.


### 4. Test the Setup
1. Open a **new Command Prompt** window (to make sure it picks up the updated environment variables).

2. Run the following to check that the `ANTLR_JAR` variable is set correctly:
```cmd
echo %ANTLR_JAR%
```
   This should return
   ```cmd
   C:\tools\antlr\antlr-4.x-complete.jar
```

## Compile Guide

### Compile to C\#
To compile to C# run the following command:
```cmd
java -jar %ANTLR_JAR% NAMEOFGRAMMAR.g4 -Dlanguage=CSharp -visitor `-no-listener`
```
Possible added arguments:
- `-Dlanguage=LANGUAGE`
- `-encoding ENCODING`
- `-o DIR`
- `-package PACKAGE_NAME`
- `-visitor`
- `-no-listener`
- `-listener`
### Compile and Print Abstract Parse Tree
1. Compile to java by:
```cmd
javac -cp %ANTLR_JAR% *.java
```
2. Run the following command with a input.txt file that you want to test
```cmd
java -cp ".;%ANTLR_JAR%" org.antlr.v4.gui.TestRig NAMEOFGRAMMAR prog -tokens < input.txt
```
Other useful options include:
- `NAMEOFGRAMMAR` is your grammar name
- `prog` is the name of the start rule in your grammar
- `-tokens` will display the tokens recognized by the lexer
- `-tree` to display the parse tree in text form
- `-gui` to display the parse tree in a graphical window
- `-trace` to print information during the parse
