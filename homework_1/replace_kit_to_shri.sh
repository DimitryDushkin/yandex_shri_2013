#!/bin/sh

run_script() {
  for f in *.html; do
    # make backup of original file
    cp "./$f" "./$f.bak"
    # replace in title some text
    # 1. extract current title
    # \1 -- part before КИТ, \2 -- part after КИТ
    replacement=$(sed 's|\(<title>.*\)КИТ\(.*</title>\)|\1ШРИ\2|' "$f")
    echo $replacement > "$f"
  done  
}


revert_files() {
  for f in *.html.bak; do
    orig_name=`echo "$f" | sed "s/....$//"`
    cp "./$f" "./$orig_name"
  done
  echo "Ok!"
}

echo "Do you want run script or revert original files?"
select option in "Run" "Revert"; do 
  case $option in
    Run ) run_script; break;;
    Revert) revert_files; break;;
  esac
done

