child_processes = 3
dead_processes = 0
# 子プロセスを 3 つ生成する
child_processes.times do
  fork do
    # それぞれ 3 秒間 sleep させる
    sleep 3
  end
end

# CHLD ハンドラの中で puts の出力をバッファリングしないよう、
# $stdout の出力を同期モードに設定する。
# こうすることで、もし puts を呼び出した後にシグナルハンドラが
# 中断された場合には ThreadError 例外が送出されるようになる。
# これはシグナルハンドラで IO を扱う場合の一般的な流儀だ。
$stdout.sync = true

# この後、親プロセスは重い計算処理で忙しくなるが、
# 子プロセスの終了は検知したい。

# そこで、:CHLD シグナルを捕捉する。こうすることで
# 子プロセスの終了時にカーネルからの通知を受信できる。

trap(:CHLD) do
  # 終了した子プロセスの情報を Process.wait で取得すれば、
  # 生成した子プロセスのどれが終了したのかがわかる。
  # ブロックせずに Process.wait をループさせることで、
  # 子プロセスの終了を見逃さないようにする。
  begin
    while pid = Process.wait(-1, Process::WNOHANG)
      puts pid
      dead_processes += 1
      # すべての子プロセスが終了した時点で明示的に親プロセスを終了させる。
      exit if dead_processes == child_processes
    end
  rescue Errno::ECHILD
  end
end

# 重い計算処理
loop do
  (Math.sqrt(rand(44)) ** 8).floor
  sleep 1
end


