# シグナルを捕捉する際の「安全」なやり方
old_handler = trap(:QUIT) {
  # プロセス終了時の後処理
  puts 'All done!'
  old_handler.call if old_handler.respond_to?(:call)
}
