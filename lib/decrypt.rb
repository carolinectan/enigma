require_relative 'enigma'

enigma = Enigma.new
handle = File.open(ARGV[0], 'r')
encrypted = handle.read
decrypted = enigma.decrypt(encrypted, ARGV[2], ARGV[3])
writer = File.open(ARGV[1], 'w')
writer.write(decrypted[:decryption])
writer.close

puts "Created 'decrypted.txt' with the key #{decrypted[:key]} and date #{decrypted[:date]}"
puts decrypted[:decryption]
