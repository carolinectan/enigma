class Character
  attr_reader :character_set

  def initialize(values)
    @character_set = values.map do |value|
      value
    end
  end
end
