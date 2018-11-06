kig_GetNowBranch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
kig_CheckNotPush() {
  pushlog=`git log --branches --oneline -1 --not --remotes 2> /dev/null`
  
  if [ -z "$pushlog" ]; then
    echo -e " \033[32m✔\033[0m "
  else
    echo -e " \033[31m✖\033[0m "
  fi
}

kig_CheckNotCommit() {
  difflog=`git diff`
  
  if [ -z "$difflog" ]; then
    echo " \033[32m✔\033[0m "
  else
    echo " \033[31m✖\033[0m "
  fi
}

kig_FormattingText() {
  if [ -a "./.git" ]; then
    echo -e " (\033[36m$(kig_GetNowBranch)\033[0m$(kig_CheckNotCommit):$(kig_CheckNotPush))"
  fi
}