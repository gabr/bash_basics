#!/bin/bash
# sysinfo_page.sh - a script to produce an HTML file

##### Constants

TITLE="My System Information"
RIGHT_NOW=$(date +"%x %r %Z")
TIME_STAMPT="Update on $RIGHT_NOW by $USER@$HOSTNAME"

##### Functions

system_info()
{
  if ls /etc/*release 1>/dev/null 2>&1; then
    echo "<h2>System release info</h2>"
    echo "<pre>"
    for i in /etc/*release; do
      head -n 1 $i
    done
    uname -orp
    echo "</pre>"
  fi
}

show_uptime()
{
 echo "<h2>System uptime</h2>
 <pre>
 $(uptime)
 </pre>"
}

drive_space()
{
 echo "<h2>Filesystem space</h2>
 <pre>
 $(df)
 </pre>"
}

home_space()
{
  echo "<h2>Home directory space by user</h2>"
  echo "<pre>"
  format="%8s%10s%10s   %-s\n"
  printf "$format" "Dirs" "Files" "Blocks" "Directory"
  printf "$format" "----" "-----" "------" "---------"
  if [ $(id -u) = "0" ]; then
    dir_list="/home/*"
  else
    dir_list=$HOME
  fi
  for home_dir in $dir_list; do
    total_dirs=$(find $home_dir -type d | wc -l)
    total_files=$(find $home_dir -type f | wc -l)
    total_blocks=$(du -s $home_dir)
    printf "$format" $total_dirs $total_files $total_blocks
  done
  echo "</pre>"
}

write_page()
{
cat << _EOF_
<html>
<head>
<title>
$TITLE
</title>
</head>

<body>
<h1>$TITLE</h1>
<p>$TIME_STAMPT</p>
$(system_info)
$(show_uptime)
$(drive_space)
$(home_space)
</body>
</html>
_EOF_
}

usage()
{
 echo "usage: sysinfo_page [[[-f file ] [-i]] | [-h]]"
}

##### Main

interact=
filename=~/sysinfo_page.html

while [ "$1" != "" ] ; do
    case $1 in
        -f | --file )           shift
                                filename=$1
                                ;;
        -i | --interactive )    interact=1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

# test code

if [ "$interact" = "1" ] ; then
    
    response=

    echo -n "Enter name of output file [$filename] : " ; read response
    if [ -n "$response" ]; then
        filename=$response
    fi

    if [ -f $filename ]; then
        echo -n "Output file exists. Overwrite? (y/n) : " ; read response
        if [ "$response" != "y" ]; then
            echo "Exiting script." ; exit 1
        fi
    fi
fi

# write_page > $filename
