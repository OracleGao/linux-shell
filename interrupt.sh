#########################
# Author: OracleGao
# Desc: 中断处理框架,利用shell接收linux系统信号，根据相应的信号自定义shell处理函数。
# Date: 20190623
#########################
#!/usr/bin/env bash
trap 'cleanup; exit 1' SIGINT SIGTERM #监听SIGINT 和SIGTERM信号，如果收到信号先执行cleanup操作，然后返回非0代表错误
function main() { #正常的check流程，注意使用了后台执行和wait为了记录下子进程的pid
    echo "do something here"
    tail -f /dev/null &
    PID=$!
    echo "tail in pid $PID"
    wait $PID
    exit 0
}
function cleanup() { #被中断后执行的清除操作，这里杀掉了上面的工作进程
    echo -e "\ncleaning up..."
    echo "killing child process $PID"
    kill -9 $PID
}
main $* # 调用正常check流程
