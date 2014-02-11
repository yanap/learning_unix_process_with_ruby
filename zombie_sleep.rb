# 1 秒後に終了する子プロセスを生成する。
pid = fork { sleep 1 }
# 終了した子プロセスの pid を出力する。
puts pid
# 親プロセスを永遠に sleep させる。
# こうしておけば子プロセスのステータスを調査できる
sleep

# ps -ho pid, state -p [ゾンビになったプロセスの pid]
