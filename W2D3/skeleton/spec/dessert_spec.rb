require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:brownie) {Dessert.new("brownie", 5, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end
    it "sets a quantity" do
      expect(brownie.quantity).to eq(5)
    end
    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to match_array([])
    end
    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("brownie", "a", chef).quantity}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      brownie.add_ingredient("sugar")
      expect(brownie.ingredients).to include("sugar")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      brownie.add_ingredient("salt")
      brownie.add_ingredient("flour")
      brownie.add_ingredient("chocolate chips")
      array = brownie.ingredients
      brownie.mix!
      expect(brownie.ingredients).to_not start_with("salt")
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      brownie.eat(5)
      expect(brownie.quantity).to be < 5
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {brownie.eat(6)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef")
      expect(brownie.serve).to eq("Chef has made 5 brownies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
