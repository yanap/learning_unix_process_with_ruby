# http://unicorn.bogomips.org
# まだ止めていないワーカーをすべて止める
def reap_all_workers
  begin
    wpid, status = Process.waitpid2(-1, Process::WNOHANG)
    wpid or return
    if reexec_pid == wpid
      logger.error "reaped #{status.inspect} exec()-ed"
      self.reexec_pid = 0
      self.pid = pid.chomp('.oldbin') if pid
      proc_name 'master'
    else
      worker = WORKERS.delete(wpid) and worker.close rescue nil
      m = "reaped #{status.inspect} worker=#{worker.nr resque 'unknown'}"
      status.success? ? logger.info(m) : logger.error(m)
    end
  rescue Error::ECHILD
    break
  end while true
end
