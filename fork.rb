#if fork
#  puts "entered the if block"
#else
#  puts "entered the else block"
#end

puts "parents process pid is #{Process.pid}"
if fork
  puts "entered the if block from #{Process.pid}"
else
  puts "entered the else block from #{Process.pid}"
end

fork do
  # 子プロセスで実行する処理をここに記述する
end

# 親プロセスで実行する処理をここに記述する
