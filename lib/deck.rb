require_relative 'card'

class Deck

  def method_missing(method_name)
    arr = [1, 2, [3, 4]]
    if arr.respond_to?(method_name)
      @cards.send(method_name)
    else
      super
    end
  end

  def initialize
    @cards = []
    populate
  end

  def populate
    suits = [:S, :H, :D, :C]
    (2..10).each do |value|
      suits.each do |suit|
        @cards << Card.new(value, suit)
      end
    end
    (11..13).each do |value|
      suits.each do |suit|
        @cards << FaceCard.new(value, suit)
      end
    end
    suits.each do |suit|
      @cards << Ace.new(14, suit)
    end
  end

  def deal(num)
    new_cards = []
    num.times { new_cards << @cards.shift }
    new_cards
  end

end
