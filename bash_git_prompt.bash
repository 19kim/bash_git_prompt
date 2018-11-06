# E-mail : kimig009@gmail.com
# Version : 1.0.1
# 적용법 : .bashrc PS1에 kig_FormattingText 함수를 넣으세요.bashrc
# $(kig_FormattingText)

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
    echo -e " \033[0m(\033[36m$(kig_GetNowBranch)\033[0m$(kig_CheckNotCommit):$(kig_CheckNotPush)\033[0m)"
  fi
}