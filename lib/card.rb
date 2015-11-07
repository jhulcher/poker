class Card
  attr_reader :value, :suit, :symbol

  def initialize(value, suit)
    @value = value
    @suit = suit
    @symbol = value.to_s.to_sym
  end

end


class FaceCard < Card
  FACE_SYMBOLS = { 14 => :"a", 13 => :"k", 12 => :"q", 11 => :"j" }

  def initialize(value, suit)
    @symbol = FACE_SYMBOLS[value]
    super
  end

end


class Ace < FaceCard
  attr_accessor :value

  def to_one
    @value = 1
  end

  def to_fourteen
    @value = 14
  end

end






#
