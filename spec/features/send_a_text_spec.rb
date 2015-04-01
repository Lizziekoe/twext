require 'rails_helper'

describe "the process of sending a text", :vcr => true do
  it "will send a meassge when the number has been verified" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit user_path(user)
    fill_in 'To', with: ENV['OUR_TO_TWILIO_NUMBER']
    fill_in 'Body', with: "Woot woo"
    click_on 'Twext Them'
    expect(page).to have_content 'Message Successfully Sent'
  end

  it "will give an error meassge when the number has not been verified" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit user_path(user)
    fill_in 'To', with: '2564'
    fill_in 'Body', with: "Woot woo"
    click_on 'Twext Them'
    expect(page).to have_content 'not a valid phone number'
  end

end
