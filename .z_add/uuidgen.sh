uuidgen () { 
  text=`/usr/bin/uuidgen | tr A-Z a-z`
  echo $text | pbcopy
  echo $text
}
