require_relative '../lib/enigma'

enigma = Enigma.new
handle = File.open(ARGV[0], 'r')
message = handle.read
encrypted = enigma.encrypt(message)
writer = File.open(ARGV[1], 'w')
writer.write(encrypted[:encryption])
writer.close

puts "Created 'encrypted.txt' with the key #{encrypted[:key]} and date #{encrypted[:date]}"
puts message
