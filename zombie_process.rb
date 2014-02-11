message = 'Good Morning'
recipient = 'tree@mybackyard.com'

pid = fork do
  # このわざとらしい例では、子プロセスを生成して統計収集器にデータを送信して、
  # 親プロセスは実際のメッセージ送信処理をそのまま続ける。
  #
  # 親プロセスとしては、この作業で処理が遅くなってほしくないし、
  # 統計収集器への送信が何らかの理由で失敗したとしても気にしない。
  StatsCollector.record message, recipient
end

# 統計を収集する子プロセスがゾンビにならないことを保証する。
Process.detach(pid)
