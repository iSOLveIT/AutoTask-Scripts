#!/bin/bash

echo "========================================="
echo "PANDOC CONVERT MULTIPLE FILES IN A FOLDER"
echo "========================================="
echo ""

echo "Type in the following details"
echo "-----------------------------"

printf "Path to folder: "; read folder_path;
printf "Input format: "; read input_fmt;
printf "Output format: "; read output_fmt; 
echo ""

md_flavours_list=("markdown" "gfm" "markdown_mmd" "markdown_phpextra" "markdown_strict")
regex_pattern="^.+(\.$input_fmt)$";
no_of_files_converted=0;

if [[ ! -e "$folder_path/converted_files/" ]]; then
  mkdir "$folder_path/converted_files";
fi

for file in $folder_path/*; do 		
  filename=$(basename "$file");
  #echo "$regex_pattern"
	
  if [[ $filename =~ $regex_pattern ]]; then
  	let no_of_files_converted=$no_of_files_converted+1;
  	if [[ " ${md_flavours_list[*]} " =~ " ${output_fmt} " ]]; then
  		pandoc -f $input_fmt -t $output_fmt $file -o "$folder_path/converted_files/${filename%.*}.md";
	else
  		pandoc -f $input_fmt -t $output_fmt $file -o "$folder_path/converted_files/${filename%.*}.$output_fmt";
	fi

  	echo "* ${filename} - Done";
  fi
done

echo ""
echo "$no_of_files_converted '$input_fmt' files converted to '$output_fmt' files. Stored under '$folder_path/converted_files'."



