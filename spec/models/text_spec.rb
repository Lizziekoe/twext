require 'rails_helper'

describe Text, :vcr => true do
  it { should belong_to :user }
  it 'adds an error if the to number is invalid' do
    text = Text.new(:body => 'hi', :to => '1111111', :from => '9712051276')
    text.save
    text.errors.messages[:base].should eq ["The 'To' number 1111111 is not a valid phone number."]
  end
end
