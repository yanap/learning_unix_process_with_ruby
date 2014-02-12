reader, writer = IO.pipe

fork do
  reader.close

  10.times do
    # 力仕事
    writer.puts "Another one bites the dust"
  end
end

writer.close
while message = reader.gets
  $stdout.puts message
end
