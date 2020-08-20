require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:icecream) { Dessert.new("icecream", 20, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(icecream.type).to eq('icecream')
    end

    it "sets a quantity" do
      expect(icecream.quantity).to eq(20)
    end

    it "starts ingredients as an empty array" do
      expect(icecream.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("icecream", "twenty", chef) }.to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      icecream.add_ingredient('ice')
      expect(icecream.ingredients).to include('ice')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = [ "ice", "milk", "chocolate"]

      ingredients.each do |items|
        icecream.add_ingredient(items)
      end

      expect(icecream.ingredients).to eq(ingredients)
      icecream.mix!
      expect(icecream.ingredients).not_to eq(ingredients)
      expect(icecream.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      icecream.eat(5)
      expect(icecream.quantity).to eq(15)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { icecream.eat(21) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Nate Oh the Icecream Master")
      expect(icecream.serve).to eq("Nate Oh the Icecream Master has made 20 icecreams!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(icecream)
      icecream.make_more
    end
  end
end
