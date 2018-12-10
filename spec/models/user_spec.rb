require 'rails_helper'

RSpec.describe User, :type => :model do

  before do
    @user = User.create(first_name: "Anything", last_name: "Anything",
                        email: "test@test.com", password: "test123", password_confirmation: "test123")
  end 

  describe 'Validations' do

    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end  

    it "is not valid without a first name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end 

    it "is not valid without a last name" do 
      @user.last_name = nil
      expect(@user).to_not be_valid
    end 

    it "is not valid without an email" do 
      @user.email = nil
      expect(@user).to_not be_valid
    end 

    it "is not valid without an email" do 
      @user.password_digest = nil
      expect(@user).to_not be_valid
    end 

    it "is not valid when passwords do not match" do 
      @user1 = User.new(first_name: "Anything", last_name: "Anything",
        email: "test1@test.com", password: "test123", password_confirmation: "anothertest")
      expect(@user1).to_not be_valid
    end 

    it "is not valid when email provided is not unique and case insensitive" do 
      @user2 = User.new(first_name: "Anything", last_name: "Anything",
        email: "TEST@TEST.com", password: "test123", password_confirmation: "test123")
      expect(@user2).to_not be_valid
    end 
  
    it "is not valid when password length is less then 7" do 
      @user3 = User.new(first_name: "Anything", last_name: "Anything",
        email: "test3@test.com", password: "test", password_confirmation: "test")
      expect(@user3).to_not be_valid
    end 

  end 

  describe '.authenticate_with_credentials' do

    it "is valid if password matches the password on file" do 
      expect(User.authenticate_with_credentials('test@test.com', 'test123')).to be_truthy
    end

    it "is valid if the email contains spaces" do 
      expect(User.authenticate_with_credentials(' test@test.com', 'test123')).to be_truthy
    end

    it "is valid if the email contains upper case letters" do 
      expect(User.authenticate_with_credentials(' TEST@test.com', 'test123')).to be_truthy
    end

  end
  
end 
