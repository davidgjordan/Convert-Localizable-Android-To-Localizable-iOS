# Convert-Localizable-Android-To-Localizable-iOS

Convert Localizable Android files(XML) to Localizable iOS files(string).
### Steps:
1. Clone the project
```sh
$ git clone https://github.com/davidgjordan/Convert-Localizable-Android-To-Localizable-iOS.git
```
2. Replace the content of string-android.xml file by your content.
3. Open a terminal and run the command.
```sh
$ ./convert.sh
```
4. Check the output in `string-ios.txt` file.

##### You are done!


Note: If any value contains `"`, it will be replaced by `“` to avoid compilation problems.