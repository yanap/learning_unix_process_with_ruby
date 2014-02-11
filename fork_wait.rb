fork do
  5.times do
    sleep 1
    puts "I am an orphan!"
  end
end

Process.wait
abort "Parent process died..."

# Process.wait は、子プロセスのどれ か 1 つが終了するまでの間、親プロセスをブロックして待つ。
