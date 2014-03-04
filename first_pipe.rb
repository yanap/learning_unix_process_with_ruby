reader, writer = IO.pipe
writer.write("Into the pipe  go ...")
writer.close
puts reader.read
