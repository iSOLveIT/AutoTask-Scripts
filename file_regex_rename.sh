#!/bin/bash

echo "================================"
echo "RENAME FILES USING REGEX_PATTERN"
echo "================================"
echo ""

echo "Type in the following details"
echo "-----------------------------"

printf "Absolute path to folder: "; read -r folder_path;
printf "Regex Pattern: "; read -r regex_pattern;
printf "Replace With: "; read -r replace_with;
echo ""

no_of_files_renamed=0;

renamed_files="${folder_path%/}/renamed_files"

if [[ ! -e $renamed_files ]]; then
  mkdir "$renamed_files";
fi

for file in "${folder_path%/}"/*; do
  if [[ "$file" != "$renamed_files" ]]; then
    cp -r "$file" "$renamed_files"
  fi
done

for file in "${renamed_files%/}"/*; do
  filename=$(basename "$file");
  ((no_of_files_renamed+1));
  # shellcheck disable=SC2001
  new_filename=$(echo "$filename" | sed -e "s/${regex_pattern}/${replace_with}/g");
  mv "$file" "${renamed_files%/}/$new_filename"
  echo "* ${filename} -> ${new_filename} - Done";
done

echo ""
echo "$no_of_files_renamed files has been renamed. Stored under '$renamed_files'."