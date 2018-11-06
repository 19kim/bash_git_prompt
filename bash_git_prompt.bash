kig_GetNowBranch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
kig_CheckNotPush() {
  pushlog=`git log --branches --oneline -1 --not --remotes 2> /dev/null`
  
  if [ -z "$pushlog" ]; then
    echo " ✔ "
  else
    echo " ✖ "
  fi
}

kig_CheckNotCommit() {
  difflog=`git diff`
  
  if [ -z "$difflog" ]; then
    echo " ✔ "
  else
    echo " ✖ "
  fi
}

kig_FormattingText() {
  if [ -a "./.git" ]; then
    echo " ($(bgp_GetNowBranch)$(bgp_CheckNotCommit):$(bgp_CheckNotPush))"
  fi
}