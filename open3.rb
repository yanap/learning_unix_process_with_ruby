require 'open3'

Open3.popen3('grep', 'data') { |stdin, stdout, stderr|
  stdin.puts "some\ndata"
  stdin.close
  puts stdout.read
}

Open3.popen3('ls', '-uhh', :err => :out) { |stdin, stdout, stderr|
  puts stdout.read
}

