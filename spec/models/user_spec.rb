require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "should create user" do
      u = User.new(name: "kay", email: "kay@kay.com", password: "kaykay", password_confirmation: "kaykay")
      expect(u).to be_valid
    end

    it "should validate presence of name" do
      u = User.new(email: "kay@kay.com", password: "kaykay", password_confirmation: "kaykay")
      expect(u).to be_invalid
    end

    it "should validate presence of email" do
      u = User.new(name: "kay", password: "kaykay", password_confirmation: "kaykay")
      expect(u).to be_invalid
    end

    it "should validate presence of password" do
      u = User.new(name: "kay", email: "kay@kay.com", password_confirmation: "kaykay")
      expect(u).to be_invalid
    end

    it "should have matching passwords" do
      u = User.new(name: "kay", email: "kay@kay.com", password: "kaykay", password_confirmation: "bobbob")
      expect(u).to be_invalid
    end

    it "should have unique email" do
      u = User.create(name: "kay", email: "kay@kay.com", password: "kaykay", password_confirmation: "kaykay")
      n = User.new(name: "new", email: "KAY@KAY.COM", password: "newnew", password_confirmation: "newnew")
      expect(n).to be_invalid
      u.destroy
    end

    it "should have a password of minimum length" do
      u = User.new(name: "kay", email: "kay@kay.com", password: "kay", password_confirmation: "kay")
      expect(u).to be_invalid
    end

  end

   describe '.authenticate_with_credentials' do

    it "should authenticate" do
      u = User.create(name: "kay", email: "kay@kay.com", password: "kaykay", password_confirmation: "kaykay")
      authenticate = u.authenticate_with_credentials(u.email, u.password)
      expect(u).to eq(authenticate)
      u.destroy
    end

    it "should authenticate" do
      u = User.create(name: "kay", email: " kay@kay.com  ", password: "kaykay", password_confirmation: "kaykay")
      authenticate = u.authenticate_with_credentials(u.email, u.password)
      expect(u).to eq(authenticate)
      u.destroy
    end

    it "should authenticate" do
      u = User.create(name: "kay", email: " kAy@kaY.cOm  ", password: "kaykay", password_confirmation: "kaykay")
      authenticate = u.authenticate_with_credentials(u.email, u.password)
      expect(u).to eq(authenticate)
      u.destroy
    end

  end

end
