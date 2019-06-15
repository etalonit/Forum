require 'rails_helper'

RSpec.describe Article, type: :model do

  let!(:user){
    create(:user)
  }

  subject{
     build(:article)
  }

  context "validation" do

    it { should validate_presence_of(:title) }

    it { should validate_presence_of(:content) }

    it { should validate_presence_of(:user_id) }

    #it "is valid with valid attributes" do
    #  expect(subject).to be_valid
    #end

    it "should not be valid without title" do
       subject.title = nil
       expect(subject).to_not be_valid
    end

    it "should not be valid without content" do
       subject.content = nil
       expect(subject).to_not be_valid
    end
  end

  context "association" do
    it { should belong_to(:user) }
    it { should belong_to(:category)}
    it { should have_many(:comments).dependent(:destroy)}
  end

end
