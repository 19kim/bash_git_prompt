getNowBranch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
CheckNotPush() {
  pushlog=`git log --branches --oneline -1 --not --remotes 2> /dev/null`
  
  if [ -z "$pushlog" ]; then
    echo " ✔ "
  else
    echo " ✖ "
  fi
}

CheckNotCommit() {
  difflog=`git diff`
  
  if [ -z "$difflog" ]; then
    echo "✔"
  else
    echo "✖"
  fi
}

FormattingText() {
  if [ -a "./.git" ]; then
    echo " ($(getNowBranch)$(CheckNotCommit):$(CheckNotPush))"
  fi
}