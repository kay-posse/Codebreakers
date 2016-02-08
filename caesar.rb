class Caesar
  CIPHER_UPPERCASE = ("A".."Z").to_a
  CIPHER_LOWERCASE = ("a".."z").to_a
  def initialize(rotator, message)
    @rotator = rotator
    @message = message
  end

  def encrypt
    
  end


end

rotator = ARGV[0]
message = ARGV[1..-1]

Caesar.new(rotator, message).encrypt
