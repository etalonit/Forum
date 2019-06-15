require 'rails_helper'

RSpec.describe Category, type: :model do

  subject{
     build(:category)
  }
  context "validation" do

    it { should validate_presence_of(:name) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "should not be valid without name" do
       subject.name = nil
       expect(subject).to_not be_valid
    end

  end

  context "association" do
    it { should have_many(:articles)}
  end

end
