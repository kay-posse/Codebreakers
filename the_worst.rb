class TheWorst
  CIPHER_UPPERCASE = ("A".."Z").to_a
  CIPHER_LOWERCASE = ("a".."z").to_a

  def initialize(key, message)
    @key = key
    @message = message
    @encrypted_message = ""
  end

  def key_indexer
    indices = @key.chars.map do |char|
      CIPHER_LOWERCASE.index(char)
    end
  end

  def encrypt
    @message.each do |word|
      word.chars.each do |char|
        if !CIPHER_LOWERCASE.include?(char) && !CIPHER_UPPERCASE.include?(char)
          @encrypted_message +=  char
        else
          
          @encrypted_message += rotate_letter(char, num)
        end
      end
    end
  end

  def rotate_letter(letter, rotator)
    if CIPHER_LOWERCASE.include?(letter)
      new_index = (CIPHER_LOWERCASE.index(letter) + rotator.to_i) % 26
      CIPHER_LOWERCASE[new_index]
    else
      new_index = (CIPHER_UPPERCASE.index(letter) + rotator.to_i) % 26
      CIPHER_UPPERCASE[new_index]
    end
  end


end

p TheWorst.new(ARGV[0], ARGV[1..-1]).key_indexer
