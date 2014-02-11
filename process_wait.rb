# 子プロセスを 3 つ生成する。
3.times do
  fork do
    # 各プロセス毎に 5 秒未満でランダムにスリープする。
    sleep rand(5)
  end
end

3.times do
  # 子プロセスそれぞれの終了を待ち、返ってきた pid を出力する。
  puts Process.wait
end

