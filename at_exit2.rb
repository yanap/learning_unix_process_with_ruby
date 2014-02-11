# Kernel#at_exit で定義されたブロックは実行される
at_exit { puts 'Last!' }
abort "Something went horribly wrong."
