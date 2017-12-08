# url-visitor
Small Bash script to check if the URL on a CSV exists or not

## Usage
`$>./url-visitor.sh /tmp/thefile.csv 20 > /tmp/thefile.post.csv`


Where the first parameter is the file to process, and the second one is the number of the column where the URL is located.

## Gotcha's
The file needs to be a CSV with a `;` delimiter