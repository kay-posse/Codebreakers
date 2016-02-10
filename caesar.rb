require "pry"
class Caesar
  attr_reader :rotator

  CIPHER_UPPERCASE = ("A".."Z").to_a
  CIPHER_LOWERCASE = ("a".."z").to_a
  def initialize(rotator, message)
    @rotator = rotator
    @message = message
    @encrypted_message = ""
  end

  def encrypt
    @message.each do |word|
      word.chars.each do |char|
        @encrypted_message += rotate_letter(char)
      end
    end
    binding.pry
  end

  def rotate_letter(letter)
    new_index = CIPHER_LOWERCASE.index(letter.downcase) + rotator.to_i
    CIPHER_LOWERCASE[new_index]
  end


end

rotator = ARGV[0]
message = ARGV[1..-1]

Caesar.new(rotator, message).encrypt
