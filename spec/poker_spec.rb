require 'rspec'
require 'deck'
require 'card'
# require 'hand'
# require 'player'
# require 'game'

describe "Deck" do

  describe '#initialize' do
    subject(:deck) { Deck.new }

    it 'initializes with 52 cards' do
      expect(deck.count).to eq(52)
    end

    it "creates instances of card" do
      expect(deck.first).to be_a(Card)
    end
  end

  describe "#shuffle" do
    subject(:deck) { Deck.new }

    it "shuffles the cards" do
      original_deck = deck.dup
      shuffled_deck = deck.shuffle

      expect(shuffled_deck).not_to eq(original_deck)
    end
  end

  describe "#deal(number_of_cards)" do
    subject(:deck) { Deck.new }

    it "loses as many cards as it deals" do

      total_cards = deck.count
      number_of_cards = 4
      deck.deal(number_of_cards)
      expected_count = total_cards - number_of_cards
      cards_left = deck.count

      expect(cards_left).to eq(expected_count)
    end
  end

end

describe "Card" do

end

describe "Hand" do

  let(:a_of_s) { double("Card", :value => 14, :suit => :S) }
  let(:a_of_d) { double("Card", :value => 14, :suit => :D) }
  let(:a_of_c) { double("Card", :value => 14, :suit => :C) }
  let(:a_of_h) { double("Card", :value => 14, :suit => :H) }
  let(:k_of_s) { double("Card", :value => 13, :suit => :S) }
  let(:q_of_s) { double("Card", :value => 12, :suit => :S) }
  let(:j_of_s) { double("Card", :value => 11, :suit => :S) }
  let(:j_of_d) { double("Card", :value => 11, :suit => :D) }
  let(:ten_of_s) { double("Card", :value => 10, :suit => :S) }
  let(:nine_of_h) { double("Card", :value => 9, :suit => :H) }
  let(:eight_of_h) { double("Card", :value => 8, :suit => :H) }
  let(:seven_of_h) { double("Card", :value => 7, :suit => :H) }
  let(:six_of_h) { double("Card", :value => 6, :suit => :H) }
  let(:five_of_h) { double("Card", :value => 5, :suit => :H) }
  let(:four_of_h) { double("Card", :value => 4, :suit => :H) }
  let(:three_of_c) { double("Card", :value => 3, :suit => :C) }
  let(:two_of_d) { double("Card", :value => 2, :suit => :D) }

  let(:royal_flush) {
    Hand.new([:a_of_s, :k_of_s, :q_of_s, :j_of_s, :ten_of_s])}
  let(:low_straight) {
    Hand.new([:a_of_s, :two_of_d, :three_of_c, :four_of_h, :five_of_h])}
  let(:ace_high) {
    Hand.new([:a_of_s, :k_of_s, :ten_of_s, :seven_of_h, :four_of_h])}
  let(:flush) {
    Hand.new([:nine_of_h, :eight_of_h, :seven_of_h, :six_of_h, :a_of_h])}
  let(:straight_flush) {
    Hand.new([:nine_of_h, :eight_of_h, :seven_of_h, :six_of_h, :five_of_h])}
  let(:straight) {
    Hand.new([:four_of_h, :five_of_h, :six_of_h, :seven_of_h, :three_of_c])}
  let(:full_house) {
    Hand.new([:a_of_s, :a_of_h, :a_of_d, :j_of_d, :j_of_s])}
  let(:four_of_a_kind) {
    Hand.new([:a_of_s, :a_of_h, :a_of_d, :a_of_c, :two_of_d])}
  let(:three_of_a_kind) {
    Hand.new([:a_of_s, :a_of_h, :a_of_d, :three_of_c, :eight_of_h])}
  let(:two_pair) {
    Hand.new([:a_of_h, :a_of_c, :j_of_s, :j_of_d, :k_of_s])}
  let(:aces_with_kicker) {
    Hand.new([:a_of_h, :a_of_c, :k_of_s, :j_of_d, :seven_of_h])}
  let(:pair_of_aces) {
    Hand.new([:a_of_s, :a_of_d, :five_of_h, :eight_of_h, :three_of_c])}
  let(:pair_of_jacks) {
    Hand.new([:a_of_h, :q_of_s, :j_of_s, :j_of_d, :four_of_h])}

  it "ranks royal flush higher than a straight flush" do
    expect(royal_flush).to be > straight_flush
  end

  it "ranks straight flush higher than four of a kind" do
    expect(straight_flush).to be > four_of_a_kind
  end

  it "ranks 4 of a kind higher than a full house" do
    expect(four_of_a_kind).to be > full_house
  end

  it "ranks full house higher than flush" do
    expect(full_house).to be > flush
  end

  it "ranks a flush higher than a straight" do
      expect(flush).to be > straight
  end

  it "ranks a 7 high straight higher than a low straight" do
    expect(straight).to be > low_straight
  end

  it "ranks a straight higher than 3 of a kind" do
    expect(straight).to be > three_of_a_kind
  end

  it "ranks 3 of a kind higher than 2 pair" do
    expect(three_of_a_kind).to be > two_pair
  end

  it "ranks a high kicker above garbage" do
    expect(aces_with_kicker).to be > pair_of_aces
  end

  it "ranks the higher pair" do
    expect(pair_of_aces).to be > pair_of_jacks
  end


end

describe "Player" do

  let(:player) { double("Player", pot: 100, hand: [1, 2, 3, nil, nil])}

  describe "#discard([card indices])" do

    it "takes that number of cards out of the hand" do
      number_of_cards = Player.hand.count
      player.discard([0, 2, 3, 4])
      cards_remaining = Player.hand.count
      expect(cards_remaining).to eq(1)
    end

    it "discards the chosen cards" do
      player.discard([3, 4])
      expected_hand = [1, 2, 3]
      expect(player.hand).to eq(expected_hand)
    end
  end

  describe "#bet(wager)" do
    it "subtracts the bet player wagers from their pot" do
      starting_pot = player.pot
      player.bet(20)
      expected_pot = starting_pot - 20
      expect(player.pot).to eq(expected_pot)
    end
  end

  describe "#wins(money)" do
    it "adds winnings to the player's pot" do
      starting_pot = player.pot
      player.wins(125)
      expected_pot = starting_pot + 125
      expect(player.pot).to eq(expected_pot)
    end
  end


end

describe "Game" do
  describe "initialize" do
    subject { Game.new }

    it "creates new instances of Player" do
      expect(Player).to receive(:new)
    end

    it "has a deck of cards" do
      expect(deck).to be_a(Deck)
    end

  end

  describe "play" do
    subject(:new_game) { Game.new }
    before(:each) do
      game.play

    end

    it "shuffles a deck" do
      expect(@deck).to receive(:shuffle)
    end

    it "keeps track of the current player" do
        expect(@current_player).to be_a(Player)
    end

    it "keeps track of the current pot" do
      expect(@pot).to be_a(Fixnum)
    end

    it "deals 5 cards to each player" do
      number_of_cards =  @current_player.hand.cards.length
      expect(number_of_cards).to eq(5)
    end

    it "asks the current player to bet" do
      expect(@current_player).to receive(bet?)
    end

    it "takes the player's money" do
      starting_pot = @pot
      @current_player.bet(20)
      expected_pot = starting_pot + 20
      expect(@pot).to eq(expected_pot)
    end

    it "asks the player if she wants to discard cards" do
      expect(@current_player).to receive(discard?)
    end




  end

end











#
