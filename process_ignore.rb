puts Process.pid
trap(:INT, "IGNORE")
sleep # シグナルを送信する時間を確保するため
