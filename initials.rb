class Initials
  def initialize(name_arguments)
    @name_arguments = name_arguments
  end

  def initials
    @name_arguments.map do |name|
      name[0].upcase
    end.join
  end

end
name_arguments = ARGV
p Initials.new(name_arguments).initials
