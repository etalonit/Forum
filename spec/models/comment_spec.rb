require 'rails_helper'

RSpec.describe Comment, type: :model do
let!(:user){create(:user)}
let!(:article){create(:article)}

  subject{
		build(:comment)
	}
  	describe "validation" do
  		it "is valid with valid attributes" do
    		expect(subject).to be_valid
  		end
      #add in back-end
	   	it "is not valid without content field" do
   			subject.content = ""
   			expect(subject).to_not be_valid
   		end
   		it "is not valid without user_id" do
   			subject.user_id = nil
   			expect(subject).to_not be_valid
   		end
   		it "is not valid without article_id" do
   			subject.article_id = nil
   			expect(subject).to_not be_valid
   		end
      #add in back-end
   		it "is not valid with too short content" do
   			subject.content = "kek"
   			expect(subject).to_not be_valid
   		end
	end
	context "association" do
     it { should belong_to(:user) }
     it { should belong_to(:article)}
end
end
