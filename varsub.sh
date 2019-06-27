###############################
# Author: OracleGao
# Desc: 替换文本中的shell变量（文本中不能包含linux指令）
# Date: 20190623
###############################
#!/usr/bin/env bash

if [ $# -lt 2 ]; then
  echo "Usage $0 <src file> <dest file>"
  exit 1
fi

while read line
do
  line=${line//\"/\\\\\"} # 双引号替换为带转义的双引号 " -> \\"
  line=${line//\'/\\\\\'} # 单引号替换为带转义的单引号 ' -> \\'

  eval echo "${line}" >> $2
done < $1
