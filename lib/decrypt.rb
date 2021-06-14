require_relative '../lib/enigma'

enigma = Enigma.new
handle = File.open(ARGV[0], "r")
encrypted_text = handle.read
decrypted_text = enigma.decrypt(encrypted_text, ARGV[2], ARGV[3])
writer = File.open(ARGV[1], "w")
writer.write(decrypted_text[:decryption])
writer.close

puts "Created 'decrypted.txt' with the key #{decrypted_text[:key]} and date #{decrypted_text[:date]}"
puts decrypted_text
