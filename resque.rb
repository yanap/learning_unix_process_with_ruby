# https://github.com/resque/resque#readme

if @child = fork
  srand # Reseeding
  procline "Forked #{@child} at #{Time.now.to_i}"
  Process.wait(@child)
else
  procline "Processing #{job.queue} since #{Time.now.to_i}"
  perform(job, &block)
  exit! unless @cant_fork
end
