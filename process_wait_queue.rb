# 子プロセスを 2 つ生成する
2.times do
 fork do
 # いずれもすぐに終了する
  abort "Finished!"
 end
end

# 親プロセスは最初のプロセスの終了を待ってから、5 秒間スリープする。
# スリープしている間に 2 つめの子プロセスが終了してしまうが、
# その時、親プロセスはスリープ中だ。
puts Process.wait
sleep 5
# 親プロセス側で再び wait を呼び出す。
# すると不思議なことに、キューに溜まっていた 2 つめの
# 子プロセスの終了情報がここに返ってくる
puts Process.wait
