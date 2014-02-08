# ユーザーからhelpオプションを渡されたか確認する
ARGV.include?('--help')
if ARGV.include?('--help'); p 'help'; end
# -c オプションの値を取得する
ARGV.include?('-c') && ARGV[ARGV.index('-c')+1]
if ARGV.include?('-c') && ARGV[ARGV.index('-c')+1]
  p ARGV
end
