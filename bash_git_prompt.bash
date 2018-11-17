# E-mail : kimig009@gmail.com
# Version : 1.1.0
# 적용법:
# 1. 해당 프로젝트를 불러옵니다.
# 2. "$ vi ~/.bashrc" 명령어 입력
# 3. vi창에서 상단 부에 "source 해당스크립트경로" 입력
# 4. 기존에 설정하는 PS1 변수에 해당 부분이 들어가기를 원하는 곳에 $(kig_FormattingText)를 넣으세요.
# 5. 완료

kig_GetNowBranch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
kig_CheckNotPush() {
  pushlog=`git log --branches --oneline -1 --not --remotes 2> /dev/null`
  
  if [ -z "$pushlog" ]; then
    echo -e " \033[32m✔\033[0m"
  else
    echo -e " \033[31m✖\033[0m"
  fi
}

kig_CheckNotCommit() {
  difflog=`git diff HEAD --name-only`
  
  if [ -z "$difflog" ]; then
    echo " \033[32m✔\033[0m "
  else
    echo " \033[31m✖\033[0m "
  fi
}

kig_FormattingText() {
  if [ -a "./.git" ]; then
    echo -e " \033[0m( \033[36m$(kig_GetNowBranch)\033[0m$(kig_CheckNotCommit):$(kig_CheckNotPush)\033[0m )\033[01;0m"
  fi
}