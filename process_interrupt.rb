puts Process.pid
trap(:INT) { print "Na na na, you can't get me" }
sleep # シグナルを送信する時間を確保するため
