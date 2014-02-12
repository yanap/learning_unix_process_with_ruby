system_handler = trap(:INT) {
  puts 'about to exit!'
  system_handler.call
}
sleep
