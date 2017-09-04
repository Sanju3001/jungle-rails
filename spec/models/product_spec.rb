require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    before(:all) do
      @cat = Category.new(name: "test category")
    end

    it "should create product" do
      p = Product.create(name:"shirt", price: 12, quantity: 12, category: @cat)
      expect(p).to be_valid
    end

    it "should validate presence of name" do
      p = Product.create(price: 12, quantity: 12, category: @cat)
      expect(p).to be_invalid
    end

    it "should validate presence of price" do
      p = Product.create(name:"shoes", quantity: 12, category: @cat)
      expect(p).to be_invalid
    end

    it "should validate presence of quantity" do
      p = Product.create(name:"socks", price: 12, category: @cat)
      expect(p).to be_invalid
    end

    it "should validate presence of category" do
      p = Product.create(name:"undies", price: 12, quantity: 12)
      expect(p).to be_invalid
    end

  end

end
