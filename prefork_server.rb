require 'socket'

# ソケットを開く
socket = TCPServer.open('0.0.0.0',  8080)

# ここでアプリケーションのコードを事前に読み込む
# require 'config/enviroment'

# 関連するシグナルについては子プロセスに転送する
[:INT, :QUIT].each do |signal|
  Signal.trap(signal) {
    wpids.each { |wpid| Process.kill(signal, wpid) }
  }
end

# 子プロセスのpidを追跡するため
wpids = []

5.times {
  wpids << fork do
    loop {
      connection = socket.accept
      connection.puts 'Hello Readers!'
      connection.close
    }
  end
}

Process.waitall
