require_relative '../lib/enigma'

enigma = Enigma.new
handle = File.open(ARGV[0], "r")
incoming_text = handle.read
encrypted_text = enigma.encrypt(incoming_text)
writer = File.open(ARGV[1], "w")
writer.write(encrypted_text[:encryption])
writer.close

puts "Created 'encrypted.txt' with the key #{encrypted_text[:key]} and date #{encrypted_text[:date]}"
puts incoming_text
