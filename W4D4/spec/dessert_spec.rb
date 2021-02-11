require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Fehc") }
  let(:cake) { Dessert.new("Cake", 10, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq("Cake")
    end
    it "sets a quantity" do
      expect(cake.quantity).to eq(10)
    end
    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to be_empty
    end
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("Chocolate Cake", "Lots!", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cake.add_ingredient("Milk")
      expect(cake.ingredients).to include("Milk")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["Milk", "Eggs", "Flour", "Sugar", "Butter"]
      ingredients.each { |ele| cake.add_ingredient(ele) }
      expect(cake.ingredients).to eq(ingredients)
      cake.mix!
      expect(cake.ingredients).not_to eq(ingredients)
      cake.mix!
      expect(cake.ingredients).not_to eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cake.eat(5)
      expect(cake.quantity).to eq(5)
    end
    it "raises an error if the amount is greater than the quantity" do
      expect { cake.eat(1000) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Fehc the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cake)
      cake.make_more
    end
  end
end
