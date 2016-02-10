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
        if !CIPHER_LOWERCASE.include?(char) && !CIPHER_UPPERCASE.include?(char)
          @encrypted_message +=  char
        else
          @encrypted_message += rotate_letter(char)
        end
      end
      @encrypted_message += " "
    end
  @encrypted_message.chop
  end

  def rotate_letter(letter)
    if CIPHER_LOWERCASE.include?(letter)
      new_index = (CIPHER_LOWERCASE.index(letter) + rotator.to_i) % 26
      CIPHER_LOWERCASE[new_index]
    else
      new_index = (CIPHER_UPPERCASE.index(letter) + rotator.to_i) % 26
      CIPHER_UPPERCASE[new_index]
    end
  end


end

rotator = ARGV[0]
message = ARGV[1..-1]

puts Caesar.new(rotator, message).encrypt
