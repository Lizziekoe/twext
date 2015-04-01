require 'rails_helper'

describe "the process of creating a new contact" do
  it "will show form when add contact is clicked", js: true do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit user_path(user)
    click_on 'Add Contact'
    expect(page).to have_content 'Name'
  end

  it "will give error message if name is blank", js: true do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit user_path(user)
    click_on "new-contact-link"
    save_screenshot('figure.png')
    click_on "Add Contact"
    expect(page).to have_content "There was a problem adding the contact"
  end


end
