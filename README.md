# night_writer_lkriffell
- Write a Ruby program that prints a line to the terminal like the one below:
```
$ ruby ./lib/night_writer.rb message.txt braille.txt
Created 'braille.txt' containing 256 characters
```
- ./lib/night_writer.rb
- ARGV[0] = message.txt
- ARGV[1] = braille.txt


- ./lib/night_writer.rb is the path to your Ruby program.
- message.txt is the name of an existing text file in your project directory.
- braille.txt is the name that we would like to give to a file that we will create in iteration 2.
- 256 is the count of characters in your message.txt file
## Breakdown of steps
- Create a Ruby program that prints the sample line of text provided above no matter what arguments are provided from the command line.
- Update your existing program so that the name of the file that it prints out changes based on the second input that the user provides from the command line.
- Further update your program so that the number of characters it prints out changes based on the number of characters in the file that the user provides as the first argument that the user provides from the command line
