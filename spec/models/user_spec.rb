require 'rails_helper'

RSpec.describe User, type: :model do

  subject{
     build(:user)
  }

  describe "validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  end

  describe "associations" do
    it { should have_many(:articles)}
  end

  describe "associations" do
    it { should have_many(:comments).dependent(:destroy)}
  end

end
