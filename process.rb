# 現在実行されている ruby プロセスの pid を出力する。
# 出力されるプロセスの番号は irb のものかもしれないし、rake や rails server、 # あるいは単なる ruby スクリプトのものかもしれない。
puts Process.pid

# 現在のプロセスの pid を取得する方法と 1 文字しか違わない
puts Process.ppid

p $$

Process.setrlimit(:NOFILE, 4096)
p Process.getrlimit(:NOFILE)

# オープンできるファイルの最大数を 3 に設定する。
# 標準ストリームでファイルディスクリプタを 3 つ使うため、
# 既に上限に達している状態になる。
Process.setrlimit(:NOFILE, 3)
File.open('/dev/null')
