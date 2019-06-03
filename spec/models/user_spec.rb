require 'rails_helper'

RSpec.describe User, type: :model do

  subject{
     build(:user)
  }

  describe "validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  context "associations" do
    it { should have_many(:articles)}

    it { should have_many(:comments).dependent(:destroy)}
  end


  describe "password validations" do

    it "should require a password" do
      User.new(subject.update(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(subject.update(:password_confirmation => "invalid")).
        should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = subject.update(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

  end

end
