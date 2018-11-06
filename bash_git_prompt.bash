getNowBranch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
CheckNotPush() {
  pushlog=git log --branches --not --remotes 2> /dev/null
  
  if [ -z pushlog ]; then
    echo "비었음."
  else
    echo "필요함"
  fi
}